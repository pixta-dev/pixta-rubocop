require 'rubocop/rake_task'

RuboCop::RakeTask.new

task :remove_rubocop_cache do
  sh "rm .rubocop-http*"
end

Rake::Task["rubocop"].enhance(%i(remove_rubocop_cache))
Rake::Task["rubocop:auto_correct"].enhance(%i(remove_rubocop_cache))
