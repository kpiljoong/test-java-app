echo "AfterInstall"

stack_id=$(aws opsworks --region us-east-1 describe-stacks --output text --query 'Stacks[?Name==`awsdemo-opsworks`].[StackId]')
echo $stack_id
layer_id=$(aws opsworks --region us-east-1 describe-layers --output text --stack-id $stack_id --query 'Layers[?Name==`HAProxy Server`].[LayerId]')
echo $layer_id
instance_ids=$(aws opsworks --region us-east-1 describe-instances --output text --layer-id $layer_id --query 'Instances[*].[InstanceId]')
echo $instance_ids
aws opsworks --region us-east-1 create-deployment --stack-id $stack_id --instance-ids $instance_ids --command "{\"Name\":\"execute_recipes\", \"Args\":{\"recipes\":[\"awsdemo::config_haproxy\"]}}"

