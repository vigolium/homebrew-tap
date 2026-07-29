# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.5-darwin-arm64.tgz"
      sha256 "8c644b16d4b68d26c8e141170ce9cf1a519ae9cf83e6e26cc5fdd83878d38325"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.5-darwin-x64.tgz"
      sha256 "dca22a7d8358fe5db0fd6849aed5bc0e9de98dad86dfb899961b8ca2c6bd40c4"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.5-linux-arm64.tgz"
      sha256 "8b44d0c109df3661fe84f0e269f5706f0e8214e1ee4b931f94a93183581627cf"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.5-linux-x64.tgz"
      sha256 "3099b3421123764d8f28282de8f1e3f8ce8977a85f44a068b0dfb78928bdee32"
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
