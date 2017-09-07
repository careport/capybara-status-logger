# Capybara::Status::Logger

Get a useful error message from Capybara when the server spits out an error page.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capybara-status-logger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-status-logger

## Usage

`include` the `Capybara::Status::Logger` mixin in your Capybara wrapper class(es)
and invoke `print_error` with the path being visited:

```ruby
...
class PageObject
  include Capybara::DSL # required
  ...
  include Capybara::Status::Logger # include mixin

  def visit(path)
    super
    print_error(path) # will check for errors and use `path` in the error message
  end

  ...
end
...
```

## Effect

Produces error messages resembling this when running Capybara tests:

```
...
     Capybara::WindowError:
       Got status 500 visiting /admin/users?as=auth0%7C3

       NameError in Admin::Users#index
       Trace:
       app/views/admin/bulk_actions/_bulk_actions.html.haml:19:in `_app_views_admin_bulk_actions__bulk_actions_html_haml___2210073073125870582_70105586184080'
...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/careport/capybara-status-logger.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
