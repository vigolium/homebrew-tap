# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.14-beta-darwin-arm64.tgz"
      sha256 "a0a45c920e5ef671cf571c7da419e1de1f35c248f84727ff7a858dd107a342ad"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.14-beta-darwin-x64.tgz"
      sha256 "c48c2bd22a74499d3dd7d00622d3197f57c2b254f551f04d903088088a975005"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.14-beta-linux-arm64.tgz"
      sha256 "cc727c0099a1133c1de365f8d5513427cc55964bc864d212aa61309d1791aebb"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.14-beta-linux-x64.tgz"
      sha256 "20670cb2f271cb01d0229d2dae9ab9450bbcbdee16e28b98205fe5de1411c31b"
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
