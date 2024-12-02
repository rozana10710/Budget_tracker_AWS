import os

# Define the base structure
project_name = "budget-tracker"
modules = ["api_gateway", "lambda", "dynamodb", "sns", "iam","cloudwatch_logs"]
base_files = ["main.tf", "variables.tf", "outputs.tf"]
root_files = ["main.tf", "variables.tf", "outputs.tf", "terraform.tfvars"]

# Create folders and files
def create_project_structure():
    # Create the base project folder
    os.makedirs(project_name, exist_ok=True)

    # Create root-level files
    for file in root_files:
        with open(os.path.join(project_name, file), "w") as f:
            f.write("")  # Create empty files

    # Create modules directory
    modules_dir = os.path.join(project_name, "modules")
    os.makedirs(modules_dir, exist_ok=True)

    # Create folders for each module with their respective files
    for module in modules:
        module_dir = os.path.join(modules_dir, module)
        os.makedirs(module_dir, exist_ok=True)
        for file in base_files:
            with open(os.path.join(module_dir, file), "w") as f:
                f.write("")  # Create empty files

    print(f"Project structure for '{project_name}' created successfully!")

# Run the function
create_project_structure()
