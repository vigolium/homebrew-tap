# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.37-beta-darwin-arm64.tgz"
      sha256 "4bf6d267edfea11679f048406adbd892c01fe475c01106c805659b2ac4d74017"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.37-beta-darwin-x64.tgz"
      sha256 "6a0b16155067bcde0b1482a20e3e9cbba559a64b42a48e49035301e10e2f9deb"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.37-beta-linux-arm64.tgz"
      sha256 "903b6dfbdfc66f5fe1b2611ba228c7f6d3f1a36db7ea32ee80e4e80c5bac9ccd"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.37-beta-linux-x64.tgz"
      sha256 "ad9d37f515319c06c4afb52770e63bbdfdcb52716ca696f5b5f5a42ce0840947"
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
