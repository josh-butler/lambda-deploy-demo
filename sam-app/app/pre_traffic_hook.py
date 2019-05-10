import boto3

codedeploy = boto3.client('codedeploy')

def handler(event, context):
    params = dict(
        deploymentId=event.get('DeploymentId'),
        lifecycleEventHookExecutionId=event.get('LifecycleEventHookExecutionId'),
        status='Succeeded'
    )

    response = codedeploy.put_lifecycle_event_hook_execution_status( **params )
    print(response)

    return dict(statusCode=200)
