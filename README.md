# lambda-deploy-demo
Automated AWS Lambda deploment demo

## Deploy CI/CD Pipeline
```bash
aws cloudformation create-stack \
--region <YOUR_DESIRED_AWS_REGION> \
--capabilities CAPABILITY_NAMED_IAM \
--stack-name demo-sam-pipeline \
--template-body file://template-pipeline.yaml \
--parameters ParameterKey=GitHubToken,ParameterValue=<YOUR_GITHUB_TOKEN>
```
