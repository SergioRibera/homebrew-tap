class SssCliNoocr < Formula
  desc "Take pretty screenshots of your screen with annotations (no OCR)"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-noocr-0.2.1-aarch64-darwin.tar.gz"
      sha256 "d21d14d4bee166a2a31d9b28f13352b78ea44d5b9c9312beee797a561b8ada60"
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
