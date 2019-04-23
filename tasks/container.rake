# frozen_string_literal: true

desc 'Build Docker Image - anchore-engine'
task :"build:image:archore-engine" do
  ecr_repo = @keystore.retrieve('ANCHORE_ENGINE_ECR_REPO')
  image_id = "#{ecr_repo}:#{ENV['deployment_id']}"
  puts "Image Tag: #{image_id}"
  @docker.build_docker_image(image_id, build_context: 'containers/anchore-engine')
  puts "Built Image Tag: #{image_id}"
  @keystore.store('LATEST_ANCHORE_ENGINE_IMAGE_ID', image_id)
end

desc 'Push Docker Image 1 - anchore-engine'
task :"push:image:archore-engine" do
  image_id = @keystore.retrieve('LATEST_ANCHORE_ENGINE_IMAGE_ID')
  @docker.push_docker_image(image_id)
  puts "Pushed #{image_id} to ECR"
end

desc 'Build Docker Image 2 - anchore-database'
task :"build:image:archore-database" do
  ecr_repo = @keystore.retrieve('ANCHORE_DATABASE_ECR_REPO')
  image_id = "#{ecr_repo}:#{ENV['deployment_id']}"
  puts "Image Tag: #{image_id}"
  @docker.build_docker_image(image_id, build_context: 'containers/anchore-database')
  puts "Built Image Tag: #{image_id}"
  @keystore.store('LATEST_ANCHORE_DATABASE_IMAGE_ID', image_id)
end

desc 'Push Docker Image - anchore-database'
task :"push:image:archore-database" do
  image_id = @keystore.retrieve('LATEST_ANCHORE_DATABASE_IMAGE_ID')
  @docker.push_docker_image(image_id)
  puts "Pushed #{image_id} to ECR"
end