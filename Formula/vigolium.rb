# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.40-beta-darwin-arm64.tgz"
      sha256 "18be547b50ccbc48c916a501a8b457b8692f909de32f2d73559d1695d00c3071"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.40-beta-darwin-x64.tgz"
      sha256 "bde613235b543f87393edb446eacdfa2539b55191b65e39253834affd5c65ded"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.40-beta-linux-arm64.tgz"
      sha256 "95a5f13a2eec932c459c91971b7215368c66fc8f0a6912106f0c0ca576c2639e"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.40-beta-linux-x64.tgz"
      sha256 "0bf6c3b8b2b069dc128d79432193db7231fb274ad2393d19f2bca53ec9ca4c04"
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
