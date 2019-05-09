import json
import os
import logging

log_level = logging.INFO
logging.basicConfig(level=log_level)
logger = logging.getLogger()
logger.setLevel(log_level)

def handler(event, context):
    logger.error('Testing error alarm')

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello SAMMY",
        }),
    }
