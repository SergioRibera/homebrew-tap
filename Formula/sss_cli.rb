class SssCli < Formula
  desc "Take pretty screenshot to your screen"
  homepage "https://github.com/SergioRibera/sss"
  if Hardware::CPU.type == :arm
    url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.4/sss_cli-aarch64-apple-darwin.tar.xz"
    sha256 "d37e8159db303e54d2ae5e8dd7645ff8c93c0093771e09300415dbbc702f6b24"
  else
    url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.4/sss_cli-x86_64-apple-darwin.tar.xz"
    sha256 "7e3ad74e7927e77ca5f9aa270e3603c939b5a32bfb49de348a9c12b186c06710"
  end
  version "0.1.4"
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
