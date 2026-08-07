# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.9-darwin-arm64.tgz"
      sha256 "2c79c62acd26d9f6f5ab12bc2d245d35f378c666fac7ee1b26926521cfa5ca0e"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.9-darwin-x64.tgz"
      sha256 "79da19a58f06c2808fc4ee8d0f5e18e67838ee38cf9e60ed757b14cee6dc0167"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.9-linux-arm64.tgz"
      sha256 "91c702d929e6cc73dd67f59000abeed233da8ca85ed4facdc198491996ccb7fa"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.9-linux-x64.tgz"
      sha256 "353bc84f54fef855b4a69b1e8976d65416f9f55042191dcbb4268529fde4bfe3"
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
