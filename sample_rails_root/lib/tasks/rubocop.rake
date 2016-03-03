if Rails.env.development?
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new

  task :remove_rubocop_cache do
    Dir.glob(".rubocop-http*").each { |file_name| sh "rm #{file_name}" }
  end

  Rake::Task["rubocop"].enhance(%i(remove_rubocop_cache))
  Rake::Task["rubocop:auto_correct"].enhance(%i(remove_rubocop_cache))
end
