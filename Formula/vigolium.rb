# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.13-beta-darwin-arm64.tgz"
      sha256 "af4ca43130c5e1d49d194862de132169da784879b9e65c740207972378631713"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.13-beta-darwin-x64.tgz"
      sha256 "658a3db066e78e17034041817cb68246fc894b6095646688127af50b20e4444f"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.13-beta-linux-arm64.tgz"
      sha256 "95fdaabffd45af78a4bad45cf7637962ec7e0f6235982e391a7727e0a13ab4ba"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.13-beta-linux-x64.tgz"
      sha256 "f64a6dcd65eb3ccb95677fbf82b7fab988ec746098be1e027610b348fe8cf4ef"
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
