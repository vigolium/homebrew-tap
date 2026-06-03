# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.19-beta-darwin-arm64.tgz"
      sha256 "8afea5dbaf76518782af954e1c71ee9d6efcc9da8212b56712e4b0bf0d2dcf34"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.19-beta-darwin-x64.tgz"
      sha256 "781e3bb49e55f30bbda4fe35b12336827574a1df684160c8b5b4a7217cc95ffc"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.19-beta-linux-arm64.tgz"
      sha256 "f4660ce8ad9d38a7ae419d3060021a7a2b83730d2d5679472b0dda00a0b2165f"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.19-beta-linux-x64.tgz"
      sha256 "e80d51b218665fc4076f32a0c9f4447d6500b94e40c962b175bb830ff4672189"
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
