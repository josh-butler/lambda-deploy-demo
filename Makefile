# Makefile for packaging & deploying AWS SAM templates
AWS_DEFAULT_REGION ?= us-east-1

# Stack name that the SAM app will be deployed under
SAM_STACK_NAME ?= sam-demo-app

.PHONY: package
package:
	cd tapi && sam package --output-template-file packaged.yaml --s3-bucket ${SAM_ARTIFACT_BUCKET}

.PHONY: deploy
deploy:
	cd tapi && sam deploy --region ${AWS_DEFAULT_REGION} --template-file packaged.yaml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM
