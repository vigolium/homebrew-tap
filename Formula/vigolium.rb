# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.0-darwin-arm64.tgz"
      sha256 "7f48ddb59da063144e4f437f2c107756685fc9fb6e81cd35752fcba87ee3feb1"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.0-darwin-x64.tgz"
      sha256 "ebef8a8e7e980e22f93efe1004ca7b7bf3f6d3eb3a0452ffbdf0a1910938d28b"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.0-linux-arm64.tgz"
      sha256 "017dc47f222352656e206215eb3df35858b0750082339832aaaf89c74a458cd9"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.5.0-linux-x64.tgz"
      sha256 "afe6a1f237cc02cf03bed9c9f5a1c1c3ff80fb251cac0aa1858d3af32c8cbe78"
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
