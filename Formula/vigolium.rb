# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.9-alpha-darwin-arm64.tgz"
      sha256 "b78c9a614217ffe9b8db4960cb3b545d3464fb4ee357273b54795a41d54b1312"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.9-alpha-darwin-x64.tgz"
      sha256 "dd5dcbe7f12f3b5b9bde0f660eb03f96ce8d1213bd3d0e5ab9dd0a58c343e1b3"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.9-alpha-linux-arm64.tgz"
      sha256 "fe833ec50ca063d8183388abc1ede589a52908aa5a15609568e5a1de610f3fbf"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.9-alpha-linux-x64.tgz"
      sha256 "282b8e010766fc419975d30b495f5339685e4cf57e204c409dfce5e18505065f"
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
