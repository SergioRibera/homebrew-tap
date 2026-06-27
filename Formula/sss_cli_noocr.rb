class SssCliNoocr < Formula
  desc "Take pretty screenshots of your screen with annotations (no OCR)"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-noocr-0.2.1-aarch64-darwin.tar.gz"
      sha256 "1ab2e38d5d696d75f447e3c156b36c2734b4245590ff636b2e9b9d23c395b5ec"
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
