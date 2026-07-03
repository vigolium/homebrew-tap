# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.45-beta-darwin-arm64.tgz"
      sha256 "23c8c0d8e680ef12b4fb85da8d001ed56a0b5117cc1d51851010ff0058e40b6b"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.45-beta-darwin-x64.tgz"
      sha256 "a86158db49279b54c111803f4f707c1678bfb7122c61f049b6ab5a87e3bb5246"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.45-beta-linux-arm64.tgz"
      sha256 "2494be4cb9993c9a402954d8a22bdae8a923014f1e24cf032b9e4d8c1ed5adb2"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.45-beta-linux-x64.tgz"
      sha256 "20e5c5ea4384ca106c80c5be17722dce172352d059741c93d9cbf92a229bb44d"
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
