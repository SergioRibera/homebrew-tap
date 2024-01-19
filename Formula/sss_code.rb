class SssCode < Formula
  desc "Take pretty screenshot to your code"
  homepage "https://github.com/SergioRibera/sss"
  if Hardware::CPU.type == :arm
    url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.6/sss_code-aarch64-apple-darwin.tar.xz"
    sha256 "c84de890ee269715de8632b16530d48639e3559a20e469bd68c77e2b1ae0ab98"
  else
    url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.6/sss_code-x86_64-apple-darwin.tar.xz"
    sha256 "5872a0567fa06159eaae007e28bf90da9d633d740033931f1d2469582b3de099"
  end
  version "0.1.6"
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
