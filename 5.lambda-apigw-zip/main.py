import logging
#import requests
import json

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    """
    The Lambda handler function that gets invoked when the API endpoint is hit
    """
    logger.info('## Original Event: %s', event)
    message = 'Hello Lambda'    
    response = {
        "statusCode": 200,
        "body": json.dumps({'message': message}),
    }
    logger.info('## Response returned: %s', response)
    return response