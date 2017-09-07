
RSpec `include_dir_context`
===========================

Manage a hierarchy of shared contexts based on spec file location

## Overview

RSpec's [shared contexts](https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-context) are a great way to organize group's shared stuff like examples and defs.
Sadly enough, there aren't many public sources which guide how to **organize** shared contexts properly.

`include_dir_context` is a nice hack you can use straight ahead to have a hierarchy of autoloaded shared contexts.

No gems or other dependencies are required, all you need is this README page.

## Usage

1. Copy code from <a href="spec/spec_helper.rb">spec_helper.rb</a> to your top-level `spec_helper.rb`.
2. To define a shared "sub-context", use `shared_context __dir__ do` in a `spec_helper.rb` at appropriate level.
3. To load shared contexts, use `include_dir_context __dir__` in an example group.

## Demo

The demo contains a simple structure of specs which uses `include_dir_context` just like any real project would.
Run this to see it in action:

```sh
$ bundle install --path vendor/bundle
$ bundle exec rspec
```

## Known issues

RSpec generates numerous warnings in case example group name is reused at different hierarchy levels.

```sh
$ bundle exec rspec
WARNING: Shared example group 'hierarchical' has been previously defined at:
  /path/to/spec/demo/spec_helper.rb:11
...and you are now defining it at:
  /path/to/spec/demo/group1/spec_helper.rb:7
The new definition will overwrite the original one.
WARNING: Shared example group 'hierarchical' has been previously defined at:
  /path/to/spec/demo/spec_helper.rb:11
...and you are now defining it at:
  /path/to/spec/demo/subdir1/group11/spec_helper.rb:7
The new definition will overwrite the original one.
WARNING: Shared example group 'hierarchical' has been previously defined at:
  /path/to/spec/demo/spec_helper.rb:11
...and you are now defining it at:
  /path/to/spec/demo/subdir2/spec_helper.rb:11
The new definition will overwrite the original one.
```

Well, RSpec is historically somewhat "procedural" and often expects you to use unique names for everything.
Please drop me a line if you discover any affordable workarounds for this issue.

## Compatibility

A minimum version of Ruby 2.0+ is required due to usage of `__dir__`.

For older versions of Ruby use this clunky replacement:

```ruby
File.realpath(File.expand_path("..", __FILE__))   # Poor man's `__dir__` for Ruby 2.0-.
```

## Cheers!

&mdash; Alex Fortuna, &copy; 2017
