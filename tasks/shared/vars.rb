# frozen_string_literal: true

@keystore = PipelineOrchestrator::Keystore.new
@docker = PipelineOrchestrator::Docker.new
@cloudformation = PipelineOrchestrator::Cloudformation.new
@crossing = PipelineOrchestrator::Crossing.new
