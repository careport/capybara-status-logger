# Capybara::Status::Error

Get a useful error message from Capybara when the server spits out an error page.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capybara-status-error'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-status-error

## Usage

`include` the `Capybara::Status::Error` mixin in your Capybara wrapper class(es)
and invoke `note_error` with the path being visited:

```ruby
...
class PageObject
  include Capybara::DSL # required
  ...
  include Capybara::Status::Error # include mixin

  def visit(path)
    super
    note_error(path) # will check for errors and use `path` in the error message
  end

  ...
end
...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/careport/capybara-status-error.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
