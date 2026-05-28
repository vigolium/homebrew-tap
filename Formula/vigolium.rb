# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.15-beta-darwin-arm64.tgz"
      sha256 "24ae749533ea72252c10e2327037b4535f73055d27988b03e2a9474f09f56522"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.15-beta-darwin-x64.tgz"
      sha256 "e6564ae3db4b229639c109a706d05ecafbe637a66e506e9c3b5595c397d81507"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.15-beta-linux-arm64.tgz"
      sha256 "84ae62f0236eddc1426c7e6020fa01085c1fcca54175be145af8399b24752006"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.15-beta-linux-x64.tgz"
      sha256 "a65d6df0b8e016f0f5a5830c7941e4b0f3a2c832dabbf05007b2d5470e89ec8f"
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
