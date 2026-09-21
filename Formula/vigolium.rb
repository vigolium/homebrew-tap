# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.9-darwin-arm64.tgz"
      sha256 "d60b48c42fb7ebb51a291ffd82fb2b12d19e4c5e97f5b4f4c8a57714b83ff789"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.9-darwin-x64.tgz"
      sha256 "2e146c102d68a6f2ff5ffa60009ac01882f5f03f1198dcf44b600c17ade47445"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.9-linux-arm64.tgz"
      sha256 "94594afbe8498012da98195c7f943bcf94564d4179c37ba21b771c0ba2768222"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.9-linux-x64.tgz"
      sha256 "901275c2ef35355b68aef34d07ea471fcc4e3f1629e466ab0d5f3e29ff2ed318"
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
