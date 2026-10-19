# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.4-darwin-arm64.tgz"
      sha256 "86a80dac81a79ea2717af64c194bbbce3bf4ad0dcf5017f03fc20a93b2a8e43e"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.4-darwin-x64.tgz"
      sha256 "91a1e5b8923dae79da3b498c8b673a217358ada26b1636c6faafb712c52567a5"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.4-linux-arm64.tgz"
      sha256 "48e026b10b208b475504b0b13b3baa07ff461b7878e098ce70ca678a889c3502"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.4-linux-x64.tgz"
      sha256 "e784a334356a8abb769b3d9a610e856bbaf4386b1db3c33d9532b6bbee368ffa"
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
