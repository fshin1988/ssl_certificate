require "ssl_certificate/version"
require "openssl"

module SslCertificate
  class Certificate < OpenSSL::X509::Certificate
    def common_name
      common_name = subject.to_a.find { |value| value[0] == 'CN' }
      if common_name
        common_name[1]
      else
        nil
      end
    end

    def alternative_name
      alt_name = extensions.find { |ex| ex.oid == 'subjectAltName' }
      if alt_name
        alt_name.value.split(',').map { |dns| dns.strip.gsub(/^DNS:/, '') }.join("\n")
      else
        nil
      end
    end

    def check_private_key_str(private_key_str)
      private_key = OpenSSL::PKey::RSA.new(private_key_str)
      check_private_key(private_key)
    end
  end
end
