# frozen_string_literal: true

desc 'Deploy Archore-Engine into ECS'
task :"deploy:container" do
  stack_name = 'DEMO-ANCHORE-ENGINE-ECS-Service'
  params = {
    'Cluster' => @keystore.retrieve('NONPROD_ECS_CLUSTER_ID'),
    'ClusterSize' => '2',
    'DeploymentID' => ENV['deployment_id'],
    'TargetGroup' => @keystore.retrieve('ANCHORE_ENGINE_TARGETGROUP'),
    'SecretsBucket' => @keystore.retrieve('S3_NONPROD_DEPLOYMENT_BUCKET'),
    'SecretsFile' => "archore-engine-configs-#{ENV['deployment_id']}.sh",
    'DemoArchoreEngineDockerImage' => @keystore.retrieve('LATEST_ANCHORE_ENGINE_IMAGE_ID'),
    'DemoArchoreDatabaseDockerImage' => @keystore.retrieve('LATEST_ANCHORE_DATABASE_IMAGE_ID')
  }

  @cloudformation.deploy_stack(stack_name, params, 'provisioning/archore_engine_ecs.yaml')
end
