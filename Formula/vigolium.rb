# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.8-darwin-arm64.tgz"
      sha256 "0653777b3b98de0fa8c39a8a38c314e1a83a1b464f59cb033319e6324b55e0d9"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.8-darwin-x64.tgz"
      sha256 "09931e45a30363140546dd3445d704f930c483ed0425babfb2536b903da12b98"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.8-linux-arm64.tgz"
      sha256 "5fc067733a81207837352fd03ccc532f3903271477ad2efc32e2508011fb97d6"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.8-linux-x64.tgz"
      sha256 "9c1908b63fb4334dce74bf88163b0c88f8ea37ba9975f02dd396792b73b6e987"
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
