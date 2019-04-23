# frozen_string_literal: true

desc 'Deploy ALB For Anchore-Engine'
task :"deploy:alb" do
  stack_name = 'DEMO-ANCHORE-ENGINE-ALB'
  params = {
    'Subnets' => @keystore.retrieve('ELB_SUBNET_IDS'),
    'VpcId' => @keystore.retrieve('VPC_ID')
  }

  @cloudformation.deploy_stack(stack_name, params, 'provisioning/anchore_engine_alb.yaml')
  @keystore.store('ANCHORE_ENGINE_ALB', @cloudformation.stack_output(stack_name, 'LoadBalancerDNSName'))
  @keystore.store('ANCHORE_ENGINE_TARGETGROUP', @cloudformation.stack_output(stack_name, 'LoadBalancerTargetGroupName'))
end
