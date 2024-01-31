class SssCode < Formula
  desc "Take pretty screenshot to your code"
  homepage "https://github.com/SergioRibera/sss"
  if Hardware::CPU.type == :arm
    url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.8/sss_code-aarch64-apple-darwin.tar.xz"
    sha256 "07199629a6f47321d24918e8c7e300f239cae1fbae516f854b23e1add16953a4"
  else
    url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.1.8/sss_code-x86_64-apple-darwin.tar.xz"
    sha256 "4de2879b9f2f55f2bdc1ccebcf0188fae14cc2323bab4672835d1de0c1ac2ac5"
  end
  version "0.1.8"
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
