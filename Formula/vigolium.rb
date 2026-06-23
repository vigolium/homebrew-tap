# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.38-beta-darwin-arm64.tgz"
      sha256 "3edd822121874696cf5c65522bbceacdbe12887d81eb306fe3b400bb49685089"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.38-beta-darwin-x64.tgz"
      sha256 "21e576df6789b207ec8a837b6d6a6a766a854ad9009589894b79a1cee5268857"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.38-beta-linux-arm64.tgz"
      sha256 "86ac7c13ad08a8d910d7219221596c44d8a18f66a379664513e8999f82db4394"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.38-beta-linux-x64.tgz"
      sha256 "116b29c83bc36f5464009d5bf4d167619f6305ebaae56739555d01da7ff75b78"
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
