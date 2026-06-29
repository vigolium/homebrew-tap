# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.42-beta-darwin-arm64.tgz"
      sha256 "f50e625b51f6e0ac011fe6a657313b01d7428a42588729179985e4b1eebbf5c2"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.42-beta-darwin-x64.tgz"
      sha256 "6921742d886d592771b73cf2fcd6a350c9fab4fa8a62274df00668c5903866d6"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.42-beta-linux-arm64.tgz"
      sha256 "059d2e0b61040d483ecdbd59519837bb6918e5aeb7b77ad7521fdd608191a3f9"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.42-beta-linux-x64.tgz"
      sha256 "a6a8e83623bcb0947c003d3c5b63eec1825cd89d37ad42b2c120de149398422a"
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
