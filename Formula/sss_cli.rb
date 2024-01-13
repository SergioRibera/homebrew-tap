class SssCli < Formula
  desc "Take pretty screenshot to your screen"
  homepage "https://github.com/SergioRibera/sss"
  if Hardware::CPU.type == :arm
    url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.1/sss_cli-aarch64-apple-darwin.tar.xz"
    sha256 "4fcac9df9aa7d7523d4ad5f160dcfec8bff4a159a1ddf7f980a13b72b3389943"
  else
    url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.1/sss_cli-x86_64-apple-darwin.tar.xz"
    sha256 "56231f6dc2d6dc40a4da44f36d4c4a872bb19a9cc51d4ff70b596c42338796e0"
  end
  version "0.1.1"
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
