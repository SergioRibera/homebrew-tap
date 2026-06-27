class SssCode < Formula
  desc "Take pretty screenshots of your code"
  homepage "https://github.com/SergioRibera/sss"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.3.1/sss_code-0.3.1-aarch64-darwin.tar.gz"
      sha256 "c7c1b65d02d90da4ebc1a527331b5be2e7091c3e4fc2cba1b8c476fb5e5bd550"
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
