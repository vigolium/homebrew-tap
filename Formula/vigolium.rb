# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.36-beta-darwin-arm64.tgz"
      sha256 "bc9b34386d355b035ebd05fe81f70b8997c1d5ff41172d314bfc334cf1dd008e"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.36-beta-darwin-x64.tgz"
      sha256 "d86abadcacbe910fc9f2472cb45edbeb14a735eaf126d77fa25907c6e4e1fd13"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.36-beta-linux-arm64.tgz"
      sha256 "330019ff7c8d37ada58dd8926a2034853dbc9a299f5a6fb60aee11a97f8e90f0"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.36-beta-linux-x64.tgz"
      sha256 "87f89db903b9f6ca938fa102b7175bda8cb2e54af2da48ca6290caae8cb5aaaf"
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
