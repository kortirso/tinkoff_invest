# TinkoffApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tinkoff_invest`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinkoff_invest'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tinkoff_invest

## Usage

Create client object.

```ruby
  require 'tinkoff_invest'
  service = TinkoffInvest::V1::Client.new(token: 'token', sandbox: false)
```

### Stocks

Request for getting stocks list.

```ruby
  service.stocks
```

### Bonds

Request for getting bonds list.

```ruby
  service.bonds
```

### Foundations

Request for getting foundations list.

```ruby
  service.etfs
```

### Search by ticker

Request for getting security by ticker.

```ruby
  service.search_by_ticker(ticker: 'ticker')
```

### Search by FIGI

Request for getting security by FIGI.

```ruby
  service.search_by_figi(figi: 'figi')
```

### Orderbook

Request for getting security's orderbook by FIGI.

```ruby
  service.orderbook(figi: 'figi', depth: 0)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kortirso/tinkoff_invest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kortirso/tinkoff_invest/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TinkoffApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kortirso/tinkoff_invest/blob/master/CODE_OF_CONDUCT.md).
