import json
import os

def handler(event, context):
    print('TABLE_NAME', os.getenv('TABLE_NAME'))
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello SAMMY",
        }),
    }
