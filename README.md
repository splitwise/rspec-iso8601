# rspec-iso8601

[![Gem Version](https://badge.fury.io/rb/rspec-iso8601.svg)](https://badge.fury.io/rb/rspec-iso8601) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This gem provides RSpec string matchers for [ISO8601 date/time strings](https://www.w3.org/TR/NOTE-datetime). It was inspired by [rspec-uuid](https://github.com/dpep/rspec-uuid).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-iso8601'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec-iso8601


And require it (`spec_helper.rb` is a good place):

```ruby
require "rspec/iso8601"
```

## Usage

```ruby
expect(your_string).to be_an_iso8601_string

# Or use the alias:
expect(your_hash).to match(abc: an_iso8601_string)
```

By default, the matcher doesn't care how many microseconds your ISO8601 string contains, if any.
But you can tell it to be more restrictive:

```ruby
# With a keyword argument:
expect(your_string).to be_an_iso8601_string(precision: 3)

# With a chained method:
expect(your_string).to be_an_iso8601_string.with_precision(3)
```

You can also restrict matches to strings with the UTC "Z" offset designator:

```ruby
expect(your_string).to be_an_iso8601_string.in_utc
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/splitwise/rspec-iso8601. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/splitwise/rspec-iso8601/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RSpec::ISO8601 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/splitwise/rspec-iso8601/blob/main/CODE_OF_CONDUCT.md).
