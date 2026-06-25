# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.39-beta-darwin-arm64.tgz"
      sha256 "9be4ed6ae7409d2d97143deae69acc2db6133b563c30dcc6f715e3ecfda27751"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.39-beta-darwin-x64.tgz"
      sha256 "f7c9d7fa58cebe092c9a842d3d013dadc996eda090eae4d8287beb6e9fec559d"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.39-beta-linux-arm64.tgz"
      sha256 "8ab4645e102ce84d1cda5aa7e3b8fcb53c31e0eedf193c2cc4998a908c95fc6c"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.39-beta-linux-x64.tgz"
      sha256 "3fe8cccca4c569d56f4707f040c0676b2f32180c8776c29a2b0e77f10814af8b"
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
