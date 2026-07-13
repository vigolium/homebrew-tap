# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.0-darwin-arm64.tgz"
      sha256 "6dc7909a7985cdbe7d48103f9c87cd15618a643cca9156cdb87b0be76fae9e29"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.0-darwin-x64.tgz"
      sha256 "4438983839ec2b85d85c164ecb4c2e376b47d5681b205a9becd064b4b72641b2"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.0-linux-arm64.tgz"
      sha256 "341ec6fa2af21605f337a7739617bcfacff67f59df195551c6ad390c6d0a7370"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.0-linux-x64.tgz"
      sha256 "9c17bac877c3de25560b63367b19fc6a3817141d91d9c5e655572f55ffacf0dd"
    end
  end

  def install
    # Each npm platform package ships the native binary gzipped at
    # vendor/<platform-tag>/vigolium.gz; decompress it and install the binary.
    gz = Dir["vendor/*/vigolium.gz"].first
    raise "vigolium.gz not found in tarball" if gz.nil?

    system "gunzip", gz
    bin.install gz.delete_suffix(".gz")
  end

  test do
    assert_match "vigolium", shell_output("#{bin}/vigolium --help")
  end
end
