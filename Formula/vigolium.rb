# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.5-darwin-arm64.tgz"
      sha256 "b0bb55f0c97c269fc85303f073fc9dbd61574ff55032c61ac34ef81e867124eb"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.5-darwin-x64.tgz"
      sha256 "f249f3b4b424de004a9eaaa33d8a727de8ee7ec137e5dbc2d04fe0038535f874"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.5-linux-arm64.tgz"
      sha256 "d76f4d887ea981903f92b646b1af37ef8b2d5c7dc096c6b8b93f043df4110268"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.5-linux-x64.tgz"
      sha256 "74336ba04ec88195c40187d34afc6611941956576ab1398bb62779af4d49326b"
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
