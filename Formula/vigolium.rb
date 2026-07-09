# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.3-darwin-arm64.tgz"
      sha256 "cace3328736f3e30362cb971874067267dcbf4b6a0bd61f8aa39c30018935ade"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.3-darwin-x64.tgz"
      sha256 "73a47fcc816a365c306aeb340602cebd7a825f9c4c0b7fb548fa3b8cdab01560"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.3-linux-arm64.tgz"
      sha256 "1a5c2a21b39ef2522a429b9cf40065667aa9781ad8b1f7f8d87a807cc3cbb801"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.2.3-linux-x64.tgz"
      sha256 "170437ab57cd0e8abe75bb8555d788209cae7c5ffa4c46a82d941e9547172448"
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
