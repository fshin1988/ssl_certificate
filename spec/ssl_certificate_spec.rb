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

  it "returns ture with valid private_key_str" do
    key_str = File.read("spec/test_data/www.example.com.key")
    expect(cert.check_private_key_by_str(key_str)).to be_truthy
  end

  it "returns false with invalid private_key_str" do
    key_str = File.read("spec/test_data/example.org.key")
    expect(cert.check_private_key_by_str(key_str)).to be_falsey
  end
end
