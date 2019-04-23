# frozen_string_literal: true

desc 'Deploy ECR Repository'
task :"deploy:ecr" do
  stack_name = 'DEMO-ANCHORE-ECR-REPOSITORY'
  params = { 'AppRepoName' => 'demo-anchore-engine', 'DBRepoName' => 'demo-anchore-database' }

  @cloudformation.deploy_stack(stack_name, params, 'provisioning/anchore_engine_ecr_repository.yaml')
  @keystore.store('ANCHORE_ENGINE_ECR_REPO', @cloudformation.stack_output(stack_name, 'DemoAppECRRepository'))
  @keystore.store('ANCHORE_DATABASE_ECR_REPO', @cloudformation.stack_output(stack_name, 'DemoDBECRRepository'))
end
