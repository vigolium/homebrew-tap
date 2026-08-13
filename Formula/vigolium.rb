# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.0-darwin-arm64.tgz"
      sha256 "05bbcbacce8eaffa3bd2676c138863267d862bef4aebe7bb1905d2fa878110e7"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.0-darwin-x64.tgz"
      sha256 "b568f8bec0ae29e49da71f331ff239e19f677ad64fb60ff70a69ec4d501ba5d5"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.0-linux-arm64.tgz"
      sha256 "9d8391c5d352bfad0b0a3322555fa4fb68de36d006e1b985b1cabef8593c271b"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.4.0-linux-x64.tgz"
      sha256 "dc82bdef0397679559f04359a3324c7ad1b42ebccc180ebc4b3850df12e483e3"
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
