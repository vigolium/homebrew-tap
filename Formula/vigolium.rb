# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.7-darwin-arm64.tgz"
      sha256 "228ec6d97d487cbfde84a741485fcf635a8dddde51b59abff503188dc91c7a64"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.7-darwin-x64.tgz"
      sha256 "2c0cf2f74c550cc6eac59338ee0cc5a66e882e957ea1a3f6d36909badbca96da"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.7-linux-arm64.tgz"
      sha256 "6ac19d2d081ff6591142ee6c510ff1f73f789e51778b745de43268473eab71c5"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.7-linux-x64.tgz"
      sha256 "a39626509b30b11aa3fd1714c51507f20d7b523bca50ac1d968846899f43ae41"
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
