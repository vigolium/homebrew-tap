# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.1-darwin-arm64.tgz"
      sha256 "844e915d15efd1a9074145591f2833cf25359754ae8d02d48a90a05c3001cf15"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.1-darwin-x64.tgz"
      sha256 "c156de680d1262d3720baf3807d0243154d878b6e48539f432f8bb735dc8eeea"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.1-linux-arm64.tgz"
      sha256 "2787718bacbc9a6118fdcd698e5c2ddd891c949a7fc52126f691932e58383cdf"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.1-linux-x64.tgz"
      sha256 "8bdd790bc2cf6c26825ea7f9686bbe8af7c921dcbf1641490270b5527f2d351f"
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
