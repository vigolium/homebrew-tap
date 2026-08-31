# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.4-darwin-arm64.tgz"
      sha256 "83e34c5ecee9daf20418d3c6980fbb7eba7b4046066f6e975010edc5448ed949"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.4-darwin-x64.tgz"
      sha256 "efe9ab5454de419a92a2c51803e9dd6303c3a2a8639bdc77d7c844b118fead53"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.4-linux-arm64.tgz"
      sha256 "a4da6be8518d0cb7c42a3f4202c67449aab9608a98f0d8b17896cfed1fb72957"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.4-linux-x64.tgz"
      sha256 "373cf10413d68ba0c59f8983b22b11267a3de2170a83054f221ed3cdf1fc7c94"
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
