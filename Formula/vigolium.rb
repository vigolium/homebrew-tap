# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.6-darwin-arm64.tgz"
      sha256 "67b28461079c19cd3cac4b3e9b15be5694ae0b54221196d0469a24724c9c1ec8"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.6-darwin-x64.tgz"
      sha256 "5ec9c2c018c79f6e6ed6413592c480f361e630ce92e872940a3fe915ee313a3c"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.6-linux-arm64.tgz"
      sha256 "7bd4f490dabf298a19ee371aed25a097f8ab3ee67b39d466b983e8b5975e1bcc"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.6-linux-x64.tgz"
      sha256 "8662f79d139bd7af79d3c9e430b267532a68c0afca2cf4153a51272b64fd1d3d"
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
