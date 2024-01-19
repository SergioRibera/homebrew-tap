class SssCli < Formula
  desc "Take pretty screenshot to your screen"
  homepage "https://github.com/SergioRibera/sss"
  if Hardware::CPU.type == :arm
    url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.2/sss_cli-aarch64-apple-darwin.tar.xz"
    sha256 "0183f88be0c58454bcef08304bd400987cc1c45757be66af94ee6e1ba1a7c59d"
  else
    url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.2/sss_cli-x86_64-apple-darwin.tar.xz"
    sha256 "de4359d5da6d9bdefe3aac79686f0f4e27398159cf4c118600fbdfb100e0861c"
  end
  version "0.1.2"
  license "MIT OR Apache-2.0"

  def install
    bin.install "sss"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
