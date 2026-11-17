# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.7-darwin-arm64.tgz"
      sha256 "ab523c8c23a3cdd7d9163e71193d33ba0779f761736516c2e68a50b762fe89f0"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.7-darwin-x64.tgz"
      sha256 "5a71bbba17993708b6ad794d0b9299ccb823ef70bedaaa77485ab29b01ae4ee5"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.7-linux-arm64.tgz"
      sha256 "29c4dca90012169e764b8b6fed147e32dd503d964e458d040b2240412c32fdcd"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.7-linux-x64.tgz"
      sha256 "03468a6533edceddb7ed8116f1ca346c5ca325ec3442d533d0a2692fcd7c6bdc"
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
