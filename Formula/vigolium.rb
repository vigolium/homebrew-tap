# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.4-darwin-arm64.tgz"
      sha256 "8418bc56f8f59a3662367f99e4111760395a7cb85ddee06144d41b826c47c8d8"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.4-darwin-x64.tgz"
      sha256 "8e3b29d435f7319ce59d7b3f84fcc884d0de5209083870dd9022bc54bb317e33"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.4-linux-arm64.tgz"
      sha256 "08081afacdc20e2e3a86f9bf6d3d50e3ede680c46351706dd96491c020a3feaa"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.4-linux-x64.tgz"
      sha256 "4fe7366a3400a1e4f05ab4b53fc7ed7c33574dfdb1ef7ecba18886c64bfcb7b6"
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
