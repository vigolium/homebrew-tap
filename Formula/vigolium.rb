# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.2-darwin-arm64.tgz"
      sha256 "9fcc82c64328b2e5d0d2daebfbee9c16f08f74e12d77a155072c5b6530a90b5c"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.2-darwin-x64.tgz"
      sha256 "03d0dd0d8e827f80606d9652f14ff53084670c671eaaa66540b02f27ec2be1bc"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.2-linux-arm64.tgz"
      sha256 "262b98206af408a83ede3b26ec63baeafb7dcaeafb63d9833a47b01e695c70d1"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.2-linux-x64.tgz"
      sha256 "7c563f74e558d370f785db4444f8cb5e10633c3aa257adf5fa5e0384b410e9a0"
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
