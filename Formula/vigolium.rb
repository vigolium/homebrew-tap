# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.3-darwin-arm64.tgz"
      sha256 "52bd324c3ec74f03038b614e3ba1f661ebe20efb2ac0b4d701e759522679e13c"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.3-darwin-x64.tgz"
      sha256 "58fc730b2e4aa03597b593a095c6641e0244c7691ad8a9cb410890974f02f88f"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.3-linux-arm64.tgz"
      sha256 "24ed6f2fedf645173a1937dd3f1746520e84ee78cab621aa2951777caedf1943"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.3-linux-x64.tgz"
      sha256 "09206d0946a91b06b6dd4f47fa445d11697f13df8ed9fedccfe0ff2769dca25f"
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
