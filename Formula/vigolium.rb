# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.3-darwin-arm64.tgz"
      sha256 "3669cde89e668ee93260b7aa860421942abfc8e60667489b8c29e19bf1fe93d1"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.3-darwin-x64.tgz"
      sha256 "64c6fd39604800a872c523a509221ec18af5aadcb5d0397c9000d47bfa1be3ab"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.3-linux-arm64.tgz"
      sha256 "20d64410c5736d2dc615261f6721d46d396e935a4af18050edbd5b79309f4a72"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.3-linux-x64.tgz"
      sha256 "1d804d10ed4348a078ad3df62bfc1423ee7cb2dda9b16503bf60251c690c71d3"
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
