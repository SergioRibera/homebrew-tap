class SssCliNoocr < Formula
  desc "Take pretty screenshots of your screen with annotations (no OCR)"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/v0.2.1/sss-noocr-0.2.1-aarch64-darwin.tar.gz"
      sha256 "17247a7df6b2ebb937af0b23b894730c1f3c78d3dcc844a9c839e76d9e7e5c96"
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
