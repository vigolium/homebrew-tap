# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.10-darwin-arm64.tgz"
      sha256 "6c2311bb569609d8b941311277c255ff5ca9a3247c67498cf3ca3ae73913cba2"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.10-darwin-x64.tgz"
      sha256 "c319de6bd9033b51fdd732e03654d8997c06c365e8e3c576ac5898549d102321"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.10-linux-arm64.tgz"
      sha256 "d59ee0e9c07da7996fba5a559aaaa8f9a54dff25f83f125af19d75b7a7b08ce4"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.10-linux-x64.tgz"
      sha256 "1ae8f023b1eafcb77889861b2c753c9f7b719267c25db1f80d6f343c4e42a633"
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
