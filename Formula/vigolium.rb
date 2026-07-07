# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.2-darwin-arm64.tgz"
      sha256 "9cf819bffc9fa0f1debc0a88a55594cc52e2e7b9e8155638b6648d36499d395b"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.2-darwin-x64.tgz"
      sha256 "cb46fdf5c0d57b371db11f893a042adbc7549a208e4c01fe41adf4df225d3596"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.2-linux-arm64.tgz"
      sha256 "02f921641f9d083b95be1dbfa5bf979d6d0508d96934c78741403a4e5fa84822"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.2-linux-x64.tgz"
      sha256 "518f1a214c9883e6b67fb4deb6d35cc35d11951b63469a017ac37d90492d780a"
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
