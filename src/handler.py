from status_code_resolver import StatusCodeResolver


def lambda_handler(event, context):
    status_cod = StatusCodeResolver.redolve(event)

    return {
        'statusCode': status_cod,
        'body': "hey aws"
    }