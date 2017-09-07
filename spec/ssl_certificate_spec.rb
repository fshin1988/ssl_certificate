require "spec_helper"

RSpec.describe SslCertificate do
  let(:cert) { SslCertificate::Certificate.new(File.read("spec/test_data/www.example.com.crt")) }

  it "has a version number" do
    expect(SslCertificate::VERSION).not_to be nil
  end

  it "returns a common_name" do
    expect(cert.common_name).to eq("www.example.com")
  end

  it "returns alternative_names" do
    expect(cert.alternative_names).to match_array(["example.com", "hoge.example.com"])
  end

  describe "checks whether a private_key string corresponds to the certificate" do
    context "with a valid private_key string" do
      it "returns true" do
        key_str = File.read("spec/test_data/www.example.com.key")
        expect(cert.check_private_key_by_str(key_str)).to be_truthy
      end
    end

    context "with a invalid private_key string" do
      it "returns false" do
        key_str = File.read("spec/test_data/example.org.key")
        expect(cert.check_private_key_by_str(key_str)).to be_falsey
      end
    end
  end

  describe "checks whether a fqdn corresponds to the certificate" do
    context "with a fqdn matching common_name" do
      it "returns true" do
        expect(cert.check_fqdn("www.example.com")).to be_truthy
      end
    end

    context "with a fqdn matching alternative_names" do
      it "returns true" do
        expect(cert.check_fqdn("hoge.example.com")).to be_truthy
      end
    end

    context "with a fqdn not matching common_name and alternative_names" do
      it "returns false" do
        expect(cert.check_fqdn("example.org")).to be_falsey
      end
    end
  end
end
