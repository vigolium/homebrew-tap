# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.29-beta-darwin-arm64.tgz"
      sha256 "ac17d4294990f6742877f9426b5f44b9838a0593d699e75b79aedcb3852c61ee"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.29-beta-darwin-x64.tgz"
      sha256 "4d1524e666d9d93255190aff6ffac26ddae1f77563becacbae84cf26f0e1670d"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.29-beta-linux-arm64.tgz"
      sha256 "e55edf6ae81f411ad1f04d8f9f87fd556486b0ed4e647054b7895d44ceebf33b"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.29-beta-linux-x64.tgz"
      sha256 "bc869802e67b3efba7c55692c07b0eefed99cdb4e50b89b174f1d37e05d05909"
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
