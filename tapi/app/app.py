import json
import os
import logging

def handler(event, context):
    if event.get('httpMethod') == 'GET':
        raise ValueError('A very specific bad thing happened.')

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello SAMMY",
        }),
    }
