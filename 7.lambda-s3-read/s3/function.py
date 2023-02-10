import boto3
import urllib.parse

s3_client = boto3.client("s3")

def handler(event, context):
    bucket = event['bucket']
    object = event['object']
    print(event['object'])
    key = urllib.parse.unquote(object.replace('/\+/g', ''))
    
    #object_key = "OBJECT_KEY"  # replace object key
    file_content = s3_client.get_object(
        Bucket=bucket, Key=key)["Body"].read()
    print(file_content)
    return file_content
        