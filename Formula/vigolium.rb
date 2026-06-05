# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.20-beta-darwin-arm64.tgz"
      sha256 "89ce671b5b1eb1248657eec46775fe85120b236d157fd0b08d9742d9423d1f8f"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.20-beta-darwin-x64.tgz"
      sha256 "4a595a4735dcafce7d7190efa7accbd11f3efeb435e75445ecd751a91cca67bc"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.20-beta-linux-arm64.tgz"
      sha256 "38216b332917d755f0d8ef0d1e07a2edfd90e8e7c05f59787d1fe2f8a67df00b"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.20-beta-linux-x64.tgz"
      sha256 "a19cb547629bb13f957c50b10cecba397d79335e95e0febbb5b7ddbffd97d729"
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
