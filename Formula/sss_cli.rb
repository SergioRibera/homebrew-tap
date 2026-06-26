class SssCli < Formula
  desc "Take pretty screenshots of your screen with annotations + OCR"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-0.2.1-aarch64-darwin.tar.gz"
      sha256 "1b2f62f201b214fcff11ecbfe433e307db30f237f5a20a807be93e731e2686d4"
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
