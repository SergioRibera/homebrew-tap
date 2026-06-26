class SssCode < Formula
  desc "Take pretty screenshots of your code"
  homepage "https://github.com/SergioRibera/sss"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.3.1/sss_code-0.3.1-aarch64-darwin.tar.gz"
      sha256 "c9884506daa788bdf7bcd9ea6f7d958889224fdc4a4cef46dee3f95b53656490"
    end
  end

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"] if Dir.exist?("lib")
    share.install Dir["share/*"] if Dir.exist?("share")
  end

  test do
    system "#{bin}/sss_code", "--version"
  end
end
