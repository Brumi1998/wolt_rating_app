def lambda_handler(event, context):
    print('Hello world from Terraform')
    return {
        'statusCode': 200,
    }