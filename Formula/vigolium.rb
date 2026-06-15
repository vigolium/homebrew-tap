# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.30-beta-darwin-arm64.tgz"
      sha256 "b344e26a3c1543b23d91c2e2aed8cbad14e9c6eb9fd3d6cc79acb78411e03a16"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.30-beta-darwin-x64.tgz"
      sha256 "d19b109dbab7f8f58257d8633278b490f01d7f9520c7758b9e721b64121d3006"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.30-beta-linux-arm64.tgz"
      sha256 "14209f996d210bd4e8776d2db6ab91f486362232b7cb0b6cfae2f90f635ce05f"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.30-beta-linux-x64.tgz"
      sha256 "c923d45881964b943b612f7d1a8cc46a3bafbf61c1714e86934cad8b77da4403"
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
