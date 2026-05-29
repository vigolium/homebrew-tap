# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.16-beta-darwin-arm64.tgz"
      sha256 "0be98916df539483c33eb3045e5424a70100f804f7f2941b4b2aa33aec2fd51c"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.16-beta-darwin-x64.tgz"
      sha256 "390b00fc95dce2a8f720963343d7fceac75bc45575edd723085b12899c4d3a6f"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.16-beta-linux-arm64.tgz"
      sha256 "956a1758fa2afd5d673119e2915ac379dc3cc42923eb271a6ed1c0caf8cd42ff"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.16-beta-linux-x64.tgz"
      sha256 "b851720041f7be8f9006aeaee885f69dadea4a09fe17bed4ef21e51f300458ef"
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
