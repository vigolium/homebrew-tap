# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.10-alpha-darwin-arm64.tgz"
      sha256 "0325f4ccce79a2d29bb2c916ee5817a8d7874dbaddc115764b639ed46b567c63"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.10-alpha-darwin-x64.tgz"
      sha256 "7434a25a32fc20e1e48ac1326b0a85ba864b7c197ebeed7188cc3ec5b38a44d3"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.10-alpha-linux-arm64.tgz"
      sha256 "d03dd18ed48891e01f02ad469f8a392095fb3b87694bdcd06222a9d3b1b7053d"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.10-alpha-linux-x64.tgz"
      sha256 "9812bf73f5fa773d0cc1940a5075a2a06e5a6953c996318e9562f248944ddc05"
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
