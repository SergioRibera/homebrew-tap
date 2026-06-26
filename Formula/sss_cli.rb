class SssCli < Formula
  desc "Take pretty screenshots of your screen with annotations + OCR"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/v0.2.1/sss-0.2.1-aarch64-darwin.tar.gz"
      sha256 "c3a21141cf11249f22c9703b7d18bcef82b95dc10df8657fe0fbf444d1d1052e"
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
