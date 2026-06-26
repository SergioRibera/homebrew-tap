class SssCli < Formula
  desc "Take pretty screenshots of your screen with annotations + OCR"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/v0.2.1/sss-0.2.1-aarch64-darwin.tar.gz"
      sha256 "73aca160140a069cbb92e31525b2516d10410db528d303ddea9ab759f228ee30"
    end
  end

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"] if Dir.exist?("lib")
    share.install Dir["share/*"] if Dir.exist?("share")
  end

  test do
    system "#{bin}/sss", "--version"
  end
end
