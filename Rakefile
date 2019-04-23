require 'pipeline_orchestrator'
require './tasks/shared/vars'

Dir.glob('tasks/*.rake').each do |task_file|
  load task_file
end

task :rubocop do
  sh 'rubocop'
end
