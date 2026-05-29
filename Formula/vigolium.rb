# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.17-beta-darwin-arm64.tgz"
      sha256 "4af36990fdf46bd55264350279f74dad3c029ce7042e0429b21acebcd6dfc8c6"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.17-beta-darwin-x64.tgz"
      sha256 "6cd50c46638146bfd1319eb789edb5df64bc0cd7bc2873123b94938d379dc0a0"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.17-beta-linux-arm64.tgz"
      sha256 "ab1d7d7aaef1faa5c1ad4033797d5e4f0025ed2317ce881437c2f12184531a5d"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.17-beta-linux-x64.tgz"
      sha256 "308baf424d343f5541cd264295b29088d8d09d22f3b5da7fb003b9193f6de1dc"
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
