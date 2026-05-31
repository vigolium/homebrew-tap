# typed: false
# frozen_string_literal: true

class Vigolium < Formula
  desc "High-fidelity vulnerability scanner fusing agentic AI with native speed"
  homepage "https://vigolium.com"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.18-beta-darwin-arm64.tgz"
      sha256 "ffaf1733265d81efeb5e2d623270180b3c70e348ccf0bb04a2c7549b44db9821"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.18-beta-darwin-x64.tgz"
      sha256 "13540fbb1ce93706f7cc18f7a86db3ab4d211a1d3aadee646ff0791a4bd0d52a"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.18-beta-linux-arm64.tgz"
      sha256 "70eb627d96180a4f0b6ba77b5134ccd4238bc7f1ca26772cd97e0ccfa242b48c"
    end
    on_intel do
      url "https://registry.npmjs.org/@vigolium/vigolium/-/vigolium-0.1.18-beta-linux-x64.tgz"
      sha256 "72561bc75cb1d402eff0051b41fe9bd1c34acb2812f31f5403e1acb6d5a1e0c5"
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
