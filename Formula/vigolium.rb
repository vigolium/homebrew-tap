# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.26-beta-darwin-arm64.tgz"
      sha256 "5f95e18a490b097d5f9005a791bfffbe9257d9c13ab8ffad45f441d53b64d463"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.26-beta-darwin-x64.tgz"
      sha256 "f9aa3a6d62f948ad518d5a5b2ec918b33d35d85be9e765b963631f073c01c99b"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.26-beta-linux-arm64.tgz"
      sha256 "485b86b0a78c8dfd0b0b51f2ce43faf87a0401bdaa9da9981aff1b4aec24ff3d"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.26-beta-linux-x64.tgz"
      sha256 "83e0a6f8f147ff7eae5c2e02ecb081167d4bf1f5e714b3a9017e2ce0d1418310"
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
