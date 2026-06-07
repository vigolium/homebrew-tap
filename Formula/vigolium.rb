# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.23-beta-darwin-arm64.tgz"
      sha256 "6b957e2c04091abf161813a91ba08cea18e3c9a60706853ec784f8449d9c634f"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.23-beta-darwin-x64.tgz"
      sha256 "a1e2d0e76b3f236fe10a4bcb03dfccd2fde442cafd3cf6272554024ebe781e54"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.23-beta-linux-arm64.tgz"
      sha256 "51a28b23e5027a79a9e0da65b2a216b7a09e288c72e61fbac8d33b69df2f1635"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.23-beta-linux-x64.tgz"
      sha256 "ddb7e333e62e2cdfb0481e28eea980e2cd388b3d8fa6425497c88b46a87b6c01"
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
