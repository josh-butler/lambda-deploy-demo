# Makefile for packaging & deploying AWS SAM templates
# export PYTHONUNBUFFERED := 1

.PHONY: package
package:
	cd tapi && sam package --output-template-file packaged.yaml --s3-bucket ${SAM_ARTIFACT_BUCKET}
