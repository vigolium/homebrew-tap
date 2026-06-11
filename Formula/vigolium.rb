# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.27-beta-darwin-arm64.tgz"
      sha256 "851bdfdec4b8b2f5237fe3c07f002ba4bdaeb9fd9f368ddc6f92a2805c428518"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.27-beta-darwin-x64.tgz"
      sha256 "369b3dca5f6c863df237415b6d2087e97c6b28e66e8595ab6a3730a9fafc8759"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.27-beta-linux-arm64.tgz"
      sha256 "bf98adcd7082cf1e6a51872744c273d9d5289235f27d899b39a0222ee0f2ada5"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.27-beta-linux-x64.tgz"
      sha256 "ce8c09b663057591dca9a87dff477efccd858b62fc34e027c9e2358efdcab9f1"
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
