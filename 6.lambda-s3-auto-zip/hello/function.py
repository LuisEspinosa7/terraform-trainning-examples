import logging
import json

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def handler(event, context):
    """
    The Lambda handler function that gets invoked when the API endpoint is hit
    """
    logger.info('## Original Event: %s', event)
    message = 'Hello Lambda!!'    
    
    if 'queryStringParameters' in event and 'Name' in event['queryStringParameters']:
        message = 'Hello ' + event['queryStringParameters']['Name'] + '!'
    
    if 'httpMethod' in event and event['httpMethod'] == 'POST' and 'Name' in event:
        message = 'Hello ' + event['Name']
    
    response = {
        "statusCode": 200,
        "body": json.dumps({'message': message}),
    }
    logger.info('## Response returned: %s', response)
    return response