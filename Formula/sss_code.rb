class SssCode < Formula
  desc "Take pretty screenshot to your code"
  homepage "https://github.com/SergioRibera/sss"
  version "0.1.9"
  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.9/sss_code-aarch64-apple-darwin.tar.xz"
      sha256 "89721264cf2f7e6ab6747ef961a2b1cd2abf9b5ddabd7d12f787e8cd2ac8e6d8"
    end
    on_intel do
      url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.9/sss_code-x86_64-apple-darwin.tar.xz"
      sha256 "823851c7848e3026a3340cd7f62b3c03c50a1413480362551d79b7ec0a64d2a1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.9/sss_code-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "33c6f547a0b71ded943f66e200b54e12b81077f52376a5a01f638ca1fbb00a70"
    end
  end
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
