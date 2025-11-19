class Simplemoji < Formula
  desc "Fast Application for look your amazing emojis write in Rust"
  homepage "https://github.com/SergioRibera/Simplemoji"
  version "1.2.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.2/simplemoji-aarch64-apple-darwin.tar.xz"
      sha256 "078feba6464f67583416fe7385f6689a56f6c58739a4570351ce817bfa358c1d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.2/simplemoji-x86_64-apple-darwin.tar.xz"
      sha256 "5886bbf99496eb9365e07e2c4001c44cfd78b5e645f7e2714015030fba027c9d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.2/simplemoji-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "679724cddbe81d51a4f2c6cd784aa0adc311135f76d9d69faa481fd9cd579ac5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.2/simplemoji-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "149f21decbd4565cc6ea24ac286c7d185faddd29ec1a826090133794ad3e2592"
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
