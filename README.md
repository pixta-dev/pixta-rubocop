# pixta-rubocop
Pixta's RuboCop Settings.

## Installation
You need to add or modify the following files to use our rubocop configuration.

* .gitignore
* .rubocop.yml
* spec/.rubocop.yml

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

# Normally additional configs of AllCops/Include and AllCops/Exclude override to RuboCops's defaults.
# But you'd like to apply both RuboCops's defaults and addtional configs of AllCops/Include and AllCops/Exclude.
# ref: https://docs.rubocop.org/en/stable/configuration/#unusual-files-that-would-not-be-included-by-default
inherit_mode:
  merge:
    - Include
    - Exclude

AllCops:
  TargetRubyVersion: TODO
  Exclude:
    - 'Gemfile'
    - 'bin/*'
    - 'config/**/*'
    - 'db/**/*'
    - 'deploy/**/*'
```

### spec/.rubocop.yml
Inherit parental `.rubocop.yml` and `rubocop_for_spec.yml`.

```yaml
inherit_from:
  - ../.rubocop.yml
  - https://raw.githubusercontent.com/pixta-dev/pixta-rubocop/master/rubocop_for_spec.yml
```

## Sample
A sample rails project adopting our RuboCop configuration is placed in [pixta-rubocop/sample_rails_root](https://github.com/pixta-dev/pixta-rubocop/tree/master/sample_rails_root).
