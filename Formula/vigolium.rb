# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.2-darwin-arm64.tgz"
      sha256 "bca6bf7953fd7ec7e8fe57ec0dd29a1ef1530c4b8aacfe89a2292069de618786"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.2-darwin-x64.tgz"
      sha256 "3ad559736b77bcc5e45bfd733790ee8c1c5bef4cc5d03b6971147f60c78a94c1"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.2-linux-arm64.tgz"
      sha256 "3c2c063789e06ffe229ad6b715ce105d2a1b3bbfc3cc248392e400020f251a3d"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.2-linux-x64.tgz"
      sha256 "5acb329fb66c817c1de5cafb82576b917e3e2a293429aa9c0157a3940fd987a1"
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
