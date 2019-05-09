import json
import os
import logging

def handler(event, context):
    # if event.get('httpMethod') == 'GET':
    #     raise ValueError('Testing error alarms')

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello world",
        }),
    }
