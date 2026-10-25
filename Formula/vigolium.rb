# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.5-darwin-arm64.tgz"
      sha256 "5baf5a3614e80d79bf927005eda426163cfd38343534d730c070503031c058ce"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.5-darwin-x64.tgz"
      sha256 "0676a209892fa776a0b14d4928d2ba7070b0203b3e1d2d2cdbb0b2840002bcec"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.5-linux-arm64.tgz"
      sha256 "96065d9fa83ee381e6499709521490de92d92273044cc9fac1e41b0080938bbd"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.5-linux-x64.tgz"
      sha256 "37e26aefae1084ffa4a612bed4ef1f757a7df04c230bbe4368344e37f13d1def"
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
