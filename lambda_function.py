import boto3
import os
import json

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])
    sns = boto3.client('sns')

    # Example logic: Log data and notify via SNS
    user_id = event.get('user_id')
    amount = event.get('amount')

    if not user_id or not amount:
        return {
            "statusCode": 400,
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps({"message": "Missing parameters"})
        }

    try:
        # Store data in DynamoDB
        table.put_item(Item={"user_id": user_id, "amount": amount})

        # Notify via SNS
        sns.publish(
            TopicArn=os.environ['SNS_TOPIC_ARN'],
            Message=f"User {user_id} logged an expense of ${amount}!"
        )

        return {
            "statusCode": 200,
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps({"message": "Expense logged successfully!"})
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps({"message": "Internal server error", "error": str(e)})
        }
