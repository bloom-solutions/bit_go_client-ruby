# BitGoClient

Ruby client for the BitGo Express server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bit_go_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bit_go_client

## Usage

In an initializer:

```ruby
BitGoClient.configure do |c|
  c.host = "http://bitgoexpress-server:3080"
end
```

```ruby
client = BitGoClient.new(access_token: "v2-my-access-token")
client.unlock(otp: "000000", duration: 600)
response = client.sendcoins(
  wallet_id: "59d2d3a4f68130b507c437e485763ab2",
  address: "2N9JiEUYgRwKAw6FfnUca54VUeaSYSL9qqG",
  coin: "tbtc",
  amount: 1_000_000,
  wallet_passphrase: "n9x47uid",
  fee_rate: 200
)
```

## Development

- `cp spec/fixtures/bit_go_express/env{.sample,}` and edit the file (not the sample) and place your proxy details. BitGo only works with static IPs. If you leave this empty, no proxy will be used.
- On your host machine, `rspec spec`
- Make changes
- `rspec spec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bloom-solutions/bit_go_client-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BitGoClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bloom-solutions/bit_go_client/blob/master/CODE_OF_CONDUCT.md).
