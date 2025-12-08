class Simplemoji < Formula
  desc "Fast Application for look your amazing emojis write in Rust"
  homepage "https://github.com/SergioRibera/Simplemoji"
  version "1.2.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.3/simplemoji-aarch64-apple-darwin.tar.xz"
      sha256 "7b8669174290228a8063bb455e8728f6d4eb07d07a2a5c7f5618fee7196b35e5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.3/simplemoji-x86_64-apple-darwin.tar.xz"
      sha256 "8ec28b9cdce4f8c9f2076f712cda5075adc0cd906a82211dedecdce43876c404"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.3/simplemoji-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4d9eff45c59b719b23fea5f0c0e66aa441c6e5d6b2785bdb4d1edc53a10b2cd2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.3/simplemoji-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0301025ed36fd9834ef30830f025606ee38c60eae892f740d6eb5d0f0890aec5"
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
