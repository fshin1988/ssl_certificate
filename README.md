# SslCertificate
ssl_certificate is wrapper of OpenSSL::X509::Certificate.

It makes you to handle ssl certificate easier.

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fshin1988/ssl_certificate.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
