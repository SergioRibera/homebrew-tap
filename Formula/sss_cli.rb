class SssCli < Formula
  desc "Take pretty screenshot to your screen"
  homepage "https://github.com/SergioRibera/sss"
  version "0.1.5"
  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.5/sss_cli-aarch64-apple-darwin.tar.xz"
      sha256 "204f9b8cbc500726f295c98a33c7e5548e9a9fb7effcf202d074b9b7de30ebc2"
    end
    on_intel do
      url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.5/sss_cli-x86_64-apple-darwin.tar.xz"
      sha256 "391aacf55149ab88e7398213ac7f9ea299d7f0750eaf019168e50e425ba780bd"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.1.5/sss_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3839b174f5d4fe5d76ec4deefb117b76dc753ce74f340edf8543802209560fcf"
    end
  end
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
