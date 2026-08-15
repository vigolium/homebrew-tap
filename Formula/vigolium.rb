# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.1-darwin-arm64.tgz"
      sha256 "144710ec165e923623299b43928d6f68d6f524a99d28426bcaf2634df72e4cbd"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.1-darwin-x64.tgz"
      sha256 "cda698a7d0e56b3698fc807ca943c3aafa4385456511ab0b0e95b81bcd3cd5e0"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.1-linux-arm64.tgz"
      sha256 "558da6489220f6d147f6aa04141e2f0b4e1ffdab7753e7cf297abeaf5483f40f"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.1-linux-x64.tgz"
      sha256 "e41561f126c8d1b9d5e106f473d85faba9a0b297b4b7ea14416d3c5724cecd09"
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
