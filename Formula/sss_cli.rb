class SssCli < Formula
  desc "Take pretty screenshots of your screen with annotations + OCR"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-0.2.1-aarch64-darwin.tar.gz"
      sha256 "b07d819ad02f406fca166f4de446d63cea3bc2f1a8f548bb4b1986bfe8760db4"
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
