import boto3
import json
import datetime


# Initialize AWS clients
s3_client = boto3.client('s3')
ses_client = boto3.client('ses', region_name="us-east-1")  # Change region if needed


# Email settings
SENDER_EMAIL = "menasafwat952@gmail.com"
RECIPIENT_EMAIL = "mr.safwat55@gmail.com"
AWS_REGION = "us-east-1"  # Change if necessary


def lambda_handler(event, context):
   print("Event:", json.dumps(event, indent=2))
  
   # Extract first (and only) event
   record = event['Records'][0]
   bucket_name = record['s3']['bucket']['name']
   object_key = record['s3']['object']['key']


   # Try to extract environment name
   try:
      env_name = object_key.split("/")[1]
   except Exception as e:
       print(f"Error parsing object key: {e}")
       env_name = object_key  # Fallback to the original key


   # Get the current time
   current_time = datetime.datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S UTC')


   # Send email notification
   response = ses_client.send_email(
       Source=SENDER_EMAIL,
       Destination={"ToAddresses": [RECIPIENT_EMAIL]},
       Message={
           "Subject": {"Data": "New File Uploaded to S3", "Charset": "UTF-8"},
           "Body": {
               "Text": {
                   "Data": f"New changes happened to the infrastructure using Terraform.\n\n"
                           f"Environment Name: {env_name}\n"
                           f"Upload Time: {current_time}",
                   "Charset": "UTF-8"
               }
           }
       }
   )


   print("Email sent! Message ID:", response["MessageId"])
  
   return {"statusCode": 200, "body": "Email sent successfully"}


