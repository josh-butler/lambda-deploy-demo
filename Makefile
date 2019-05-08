# Makefile for packaging & deploying AWS SAM templates
AWS_DEFAULT_REGION ?= us-east-1

# Stack name that the SAM app will be deployed under
SAM_STACK_NAME ?= sam-demo-app

# Directory that contains the SAM app
SAM_DIR := tapi


.PHONY: install
install:
	apt-get update -y
	pip install --user aws-sam-cli

.PHONY: test
test:
	python -m pytest ${APP_DIR}/tests/ -v

.PHONY: package
package:
	sam package --template-file $(SAM_DIR)/template.yaml --s3-bucket ${SAM_ARTIFACT_BUCKET} --output-template-file $(SAM_DIR)/packaged.yaml

.PHONY: deploy
deploy:
	sam deploy --region ${AWS_DEFAULT_REGION} --template-file $(SAM_DIR)/packaged.yaml --stack-name $(SAM_STACK_NAME) --capabilities CAPABILITY_IAM
