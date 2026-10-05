# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.2-darwin-arm64.tgz"
      sha256 "534144f449272b954b0c45625b97542ece61f9e2b28f13d0295a06b4a1561f2f"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.2-darwin-x64.tgz"
      sha256 "6b44c5f4d215625a0cb24af2d5da32c380233731ce675407937ffac20f7df8d5"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.2-linux-arm64.tgz"
      sha256 "07582631738b900e389487859ad8822aebb22efa2570569e880cab440bfe0b27"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.2-linux-x64.tgz"
      sha256 "6a4982637e17dfef6e84624938bbef7d76f8ec063c2c4082a244adbbdc0bd3f7"
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
