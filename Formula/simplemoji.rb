class Simplemoji < Formula
  desc "Fast Application for look your amazing emojis write in Rust"
  homepage "https://github.com/SergioRibera/Simplemoji"
  version "1.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.1/simplemoji-aarch64-apple-darwin.tar.xz"
      sha256 "129fd66f15ebd67928922d9b055b6c0accc7bdfd1e1bb03853b48e490bf24ce7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.1/simplemoji-x86_64-apple-darwin.tar.xz"
      sha256 "661d4b4cc10ba56a80715c0a838fd7d1990408f4ff25346a52e0c79738ba72bd"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.1/simplemoji-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5163fff4b4f211550178aca18743e78fd2cd2356300fdcbe11fa905e2fda5569"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.1/simplemoji-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2e2745eef2e9b1e13b4962cc02ab5e561e7603ee5b12de2807b77438cf12d3ee"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "simplemoji" if OS.mac? && Hardware::CPU.arm?
    bin.install "simplemoji" if OS.mac? && Hardware::CPU.intel?
    bin.install "simplemoji" if OS.linux? && Hardware::CPU.arm?
    bin.install "simplemoji" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
