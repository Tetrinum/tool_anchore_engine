@Library('pipeline-helpers')
import pipeline.RVMHelper

node {
  stage('Checkout SCM') {
    // Checkout SCM
    checkout scm

    rvm = new RVMHelper()
    rvm.setup('2.5.1', 'anchore-engine')
    rvm.createLabeledStep('Install Pipeline Gems', 'bundle install')
    env.deployment_id = sh(returnStdout: true, script: 'echo $(date +%Y%m%d%H%M%S)-$(uuidgen | cut -d - -f 1)').trim()
  }

  stage('Static Analysis') {
    // Static Analysis
    rvm.rake_cmd('rubocop')
  }

  stage('Deploy ECR Repository') {
    // Deploy ECR Repository
    rvm.rake_cmd('deploy:ecr')
  }

  stage('Build Anchore-Engine Image') {
    // Build SonarQube Image
    rvm.rake_cmd('build:image:archore-engine')
  }

  stage('Build Anchore-Database Image') {
    // Build SonarQube Image
    rvm.rake_cmd('build:image:archore-database')
  }

  stage('Push Anchore-Engine Image') {
    // Push SonarQube Image
    rvm.rake_cmd('push:image:archore-engine')
  }

  stage('Push Anchore-Database Image') {
    // Push SonarQube Image
    rvm.rake_cmd('push:image:archore-database')
  }

  stage('Deploy Anchore-Engine ALB') {
    // Deploy SonarQube Application Load Balancer
    rvm.rake_cmd('deploy:alb')
  }

  stage('Deploy Anchore-Engine Container into ECS') {
    // Deploy SonarQube Container
    rvm.rake_cmd('deploy:container')
  }
}
