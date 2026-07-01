# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.43-beta-darwin-arm64.tgz"
      sha256 "10f36fda4acbd915a0a657e37d282958dae4d61482e1cff347b61ab69aec4e56"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.43-beta-darwin-x64.tgz"
      sha256 "6ed2acebe38ffe0e6b2134f222bf52a64fe15a611d61ac42b00f5a78e7590544"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.43-beta-linux-arm64.tgz"
      sha256 "4d518b442c775a4c71bbb15caf808ca723389f43fa5060976b6b1a53228a50f7"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.43-beta-linux-x64.tgz"
      sha256 "dff5aa29d1108fbf5fc9374c197656e6d362d1ec49df32c31049340de4d8ba5e"
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
