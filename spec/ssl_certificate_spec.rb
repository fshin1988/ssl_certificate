require "spec_helper"

RSpec.describe SslCertificate do
  it "has a version number" do
    expect(SslCertificate::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
