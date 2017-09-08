# SslCertificate
ssl_certificate is wrapper of OpenSSL::X509::Certificate.
it makes you to handle ssl certificate easier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ssl_certificate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ssl_certificate

## Usage
```ruby
require 'ssl_certificate'

# create object from certificate of pem or der format
cert_pem = File.read("spec/test_data/www.example.com.crt")
cert = SslCertificate::Certificate.new(cert_pem)

cert.common_name
# => "www.example.com"

cert.alternative_names
# => ["example.com", "hoge.example.com"]

key_pem = File.read("spec/test_data/www.example.com.key")
cert.check_private_key_str(key_pem)
# => true

# check whether a fqdn corresponds to the certificate
cert.check_fqdn("www.example.com")
# => true
cert.check_fqdn("hoge.example.com")
# => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fshin1988/ssl_certificate.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
