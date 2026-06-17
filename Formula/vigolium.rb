# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.33-beta-darwin-arm64.tgz"
      sha256 "5a41296219d5b7f5753e0c85abb17c7fa21b8dc5b0a309911c65be09f7eb1e79"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.33-beta-darwin-x64.tgz"
      sha256 "ae2d17cd0cd484c559b8674dc1e34b766b3185aa2b937fcf1a57bdfb57b22f1e"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.33-beta-linux-arm64.tgz"
      sha256 "68987ff63335cd47ae2e5869c40ae38bab39e9b846f6fbf92b382b371cec9c5e"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.33-beta-linux-x64.tgz"
      sha256 "b23989d91db3abd0fa46b50e049f5379c6079ef1bcd8856a05c68dfff4fa8866"
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
