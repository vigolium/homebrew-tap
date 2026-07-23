# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.4-darwin-arm64.tgz"
      sha256 "40bf5e404d8fb6e0f94af8d0686ee4c15fac60715397e678020f7c210e5b682c"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.4-darwin-x64.tgz"
      sha256 "fecc6bd3bb2d1aa12db258220e9e9634ecabc69a73855c1293c083b1e71573cc"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.4-linux-arm64.tgz"
      sha256 "a1696d9e04bc7513598b1adef66e01cf4693606f648fc9bbc742d4627ef35783"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.4-linux-x64.tgz"
      sha256 "3e88f5617e07b37be65b9e302d7c78169ea3388fe99ff7ddecce35d936d2d6e3"
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
