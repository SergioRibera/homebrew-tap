class SssCode < Formula
  desc "Take pretty screenshot to your code"
  homepage "https://github.com/SergioRibera/sss"
  if Hardware::CPU.type == :arm
    url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.5/sss_code-aarch64-apple-darwin.tar.xz"
    sha256 "72dc6510a7843175825002e9eccd13286235453ef122127ef8604caf39bac6db"
  else
    url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.5/sss_code-x86_64-apple-darwin.tar.xz"
    sha256 "2678ce76dbfcfd0f98e5e9a07e9eb69562738881927bb94f4922ea2743ec2015"
  end
  version "0.1.5"
  license "MIT OR Apache-2.0"

  def install
    bin.install "sss_code"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
