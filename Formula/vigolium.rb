# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.0-darwin-arm64.tgz"
      sha256 "4e1eafc03e103489d343f9d62b95e81ae74e0f498c64d7b30cdd8598cb3c8cd0"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.0-darwin-x64.tgz"
      sha256 "9837b83bd6f5a99e80825cf169262f3a222d09c97843abfcd2ea9a0adc70ab91"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.0-linux-arm64.tgz"
      sha256 "793d0a152c53bcbd06a0f76beed17ec391b07bd55b631aa26cc80789b72d2be8"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.0-linux-x64.tgz"
      sha256 "7a43368cd30f3a4a6f4b29c484c0206d555f69242812eced97e834205fd54d07"
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
