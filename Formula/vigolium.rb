# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.6-darwin-arm64.tgz"
      sha256 "175d3765bf20d1ee68d9d247e3a381d2a7171d157f71b147d9d94172664fc77a"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.6-darwin-x64.tgz"
      sha256 "21bb5a4b6f1ad8425854f7a60784fc5975a1d4068aafbc9afb163024aaa87e9b"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.6-linux-arm64.tgz"
      sha256 "788d2e58d359991940222ae74762695d09e0b625a8226b3ce630b9b0858306b4"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.6-linux-x64.tgz"
      sha256 "a33e99e4938d11cffab7802e5d56933daaaf9f1a6b0274011edba8b323b099e8"
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
