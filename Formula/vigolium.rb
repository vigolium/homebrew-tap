# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.3-darwin-arm64.tgz"
      sha256 "8a4be9fc826d8d26849aebf0ac5dc52dc4825087c8f1413dd9137ad314f6b507"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.3-darwin-x64.tgz"
      sha256 "a3903ea47842f5033e1102f300daaa59a35b1876368c945a0cbe3b74d9cadc12"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.3-linux-arm64.tgz"
      sha256 "ee7f1fdac963e3ac22960950bf8213d8794ff5e7c6727c1db961b8def13aba5a"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.3-linux-x64.tgz"
      sha256 "f1180c3c505209e34e14246f7c00c69eb0a454cc43899ea8f1fa780b161cc8c3"
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
