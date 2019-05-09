import json
import os
import logging

def handler(event, context):
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello SAMMY world",
        }),
    }
