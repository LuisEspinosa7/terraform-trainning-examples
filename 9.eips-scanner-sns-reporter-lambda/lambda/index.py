import logging
import boto3
import os

LOGGER = logging.getLogger()
LOGGER.setLevel(logging.INFO)

client = boto3.client('ec2')
sesClient = boto3.client('ses')

SOURCE_EMAIL = os.environ['SOURCE_EMAIL']
DEST_EMAIL = os.environ['DEST_EMAIL']


def handler(event, context):
    response = client.describe_addresses()
    eips = []
    for eip in response['Addresses']:
        if 'InstanceId' not in eip:
            eips.append(eip['PublicIp'])
        
    LOGGER.info(eips)
    
    if eips:
        sesClient.send_email(
            Source = SOURCE_EMAIL,
            Destination = {
                'ToAddresses': [
                    DEST_EMAIL
                ]
            },
            Message={
                'Subject': {
                    'Data': 'Unused EIPS',
                    'Charset': 'utf-8'
                },
                'Body': {
                    'Text': {
                        'Data': str(eips),
                        'Charset': 'utf-8'
                    }
                }
            }
        )