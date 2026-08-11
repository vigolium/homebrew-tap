# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.12-darwin-arm64.tgz"
      sha256 "eadd7ce9dd5ba8472621c1053c6486862ee71b59395ad10de6a01ec396747d38"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.12-darwin-x64.tgz"
      sha256 "e61311fec2ce1294cad5d4a2048cb6b33704845fe4427abae8d50a0268336cbc"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.12-linux-arm64.tgz"
      sha256 "e74a98efe3d2c8d800011b9486f4982d8a240c72477c25059c5d932381b38259"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.3.12-linux-x64.tgz"
      sha256 "b92fa91ac5bc9b7229e47f318d58420224b267c268a1e5265c558b8c1de9e108"
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
