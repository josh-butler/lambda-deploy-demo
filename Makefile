# Makefile for packaging & deploying AWS SAM templates
AWS_DEFAULT_REGION ?= us-east-1

# Stack name that the SAM app will be deployed under
SAM_STACK_NAME ?= sam-demo-app

# Directory that contains the SAM app
APP_DIR := tapi


.PHONY: install
install:
	apt-get update -y
	pip install pytest pytest-mock --user
	pip install --user aws-sam-cli

.PHONY: test
test:
	cd ${APP_DIR} && python -m pytest tests/ -v

.PHONY: package
package:
	sam package --template-file $(APP_DIR)/template.yaml --s3-bucket ${SAM_ARTIFACT_BUCKET} --output-template-file $(APP_DIR)/packaged.yaml

.PHONY: deploy
deploy:
	sam deploy --region ${AWS_DEFAULT_REGION} --template-file $(APP_DIR)/packaged.yaml --stack-name $(SAM_STACK_NAME) --capabilities CAPABILITY_IAM
