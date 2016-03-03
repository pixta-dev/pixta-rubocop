# pixta-rubocop
Pixta's RuboCop Settings.

## Installation
You need to add or modify the following files to use our rubocop configuration.

* Gemfile
* .gitignore
* .rubocop.yml
* spec/.rubocop.yml
* lib/tasks/rubocop.rake

### Gemfile
Add `robocop` to your repository.

```ruby
group :development do
  gem "rubocop"
end
```

### .gitignore
Ignore `.rubocop-http*` files which are cached files.

```git
.rubocop-http*
```

### .rubocop.yml
Inherit `rubocop.yml` and add specific settings for each repository like `AllCops`.

```yaml
inherit_from:
  - https://raw.githubusercontent.com/pixta-dev/pixta-rubocop/master/rubocop.yml

AllCops:
  TargetRubyVersion: 2.2
  Include:
    - '**/Rakefile'
    - '**/config.ru'
  Exclude:
    - 'vendor/**/*'
    - 'bin/*'
    - 'config/**/*'
    - 'Gemfile'
    - 'db/**/*'
    - 'deploy/**/*'
    - 'frontend/**/*'
    - 'admin/vendor/**/*'
    - 'admin/bin/*'
    - 'admin/config/**/*'
    - 'admin/Gemfile'
    - 'admin/db/**/*'
    - 'admin/lib/admin/version.rb'
    - 'admin/lib/admin/engine.rb'
```

### spec/.rubocop.yml
Inherit parental `.rubocop.yml` and `rubocop_for_spec.yml`.

```yaml
inherit_from:
  - ../.rubocop.yml
  - https://raw.githubusercontent.com/pixta-dev/pixta-rubocop/master/rubocop_for_spec.yml
```

### lib/tasks/rubocop.rake
Remove `.rubocop-http*` files so that `rubocop` doesn't read cached configuration files.

```ruby
if Rails.env.development?
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new

  task :remove_rubocop_cache do
    Dir.glob(".rubocop-http*").each { |file_name| sh "rm #{file_name}" }
  end

  Rake::Task["rubocop"].enhance(%i(remove_rubocop_cache))
  Rake::Task["rubocop:auto_correct"].enhance(%i(remove_rubocop_cache))
end
```

## Usage
### Run RuboCop
```bash
bundle exec rake rubocop
```

### Auto-correct RuboCop offenses
```bash
bundle exec rake rubocop
```

## Sample
A sample rails project adopting our RuboCop configuration is placed in [pixta-rubocop/sample_rails_root](https://github.com/pixta-dev/pixta-rubocop/tree/master/sample_rails_root).
