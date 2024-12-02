---

Let's get a little less poor with AWS

Aren't we all?As I'm preparing for my AWS certificate, hands on and projects are key factor to ensure I'm making sense out of any service.
I asked ChatGPT to suggest a project that integrates AWS with a day to day problem that I can fix- using AWS.
Since it knows much about my very poor spending habits, It suggested I make a "budget tracker" - and I did feel personally attacked, but here we go:

---

First things first; I always use Terraform to deploy my AWS projects because - I had to learn it the hard way: You leave resources undeleted, and good luck with that credit score..
So in order to avoid leaving any traces, I use "Terraform destroy" at the end, and feel so satisfied.

---

Services used:
- AWS Lambda - Executes business logic to process the request (e.g., logging expenses).
- API Gateway - Exposes the API for the incoming request
- IAM (Identity and Access Management) - Manages permissions and access to resources.
- AWS SDK or AWS CLI - Used for interacting with AWS services programmatically, if applicable.
- All created (and deleted) using terraform, so familiarize yourself with IaaC along the way ;)
- To make my life easier, I used modules; where every service in its own module, so that I can test each's functionality
- I also create a "create_file.py" script to create the directory structure for me as I'm so lazy.

---

Flow of the Request:
The way I want to use this app, is by sending a POST request with the user_id and amount to the API gateway.

API gateway POST resource The payload is sent to a lambda function for processing to be sent to the database

The lambda functionThe database stores and retrieves the data.

The DynmoDBAll whilst applying fine grained permissions using IAM

I won't go into to much details as the whole code is uploaded to my github repository with detailed comments that you can check here: https://github.com/rozana10710/Budget_tracker_AWS.git

---

Testing
Testing the API with Postman or cURL:
Send a POST request to the /expense endpoint with the necessary payload.
Verify the response status code and body.

Test with cURL:
curl -X POST https://your-api-gateway-url/expense \
  -H "Content-Type: application/json" \
  -d '{"user_id": "12345", "amount": 100 }'

---

Possible outcomes
Example Request (POST /expense)
{
  "user_id": "12345",
  "amount": 100,
  "category": "Food"
}
Example Response (Success):
{
  "statusCode": 200,
  "message": "Expense recorded successfully"
}
Example Response (Error):
{
  "statusCode": 400,
  "message": "Missing parameters"
}

---

Troubleshooting
Possible issues I encountered:
502 Bad Gateway: Ensure the Lambda function is properly configured and has permission to access the database. Check CloudWatch logs for Lambda errors.
Missing Parameters: Ensure that all required fields (e.g., user_id, amount) are passed in the request body.
Permissions Errors: Verify IAM roles and policies for Lambda, API Gateway, and DynamoDB.
