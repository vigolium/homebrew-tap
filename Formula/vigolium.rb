# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.11-beta-darwin-arm64.tgz"
      sha256 "0dd327d3b474caebaea406417031f8269aa2b2a663a7deca47516b60d451e8a4"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.11-beta-darwin-x64.tgz"
      sha256 "dcb04f8526317b37d12d00c4ccf139da9144b647c14f6ec00aedefb9312bdb1d"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.11-beta-linux-arm64.tgz"
      sha256 "71e79248f1e8c045e179b7656d4033e1438f36f438c73ccb18816f014d682622"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.11-beta-linux-x64.tgz"
      sha256 "a79af13e280253b57bb7d412be818ef54cb5455d5b4518b33e226cc3b1346ffc"
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
