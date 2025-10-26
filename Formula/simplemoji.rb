class Simplemoji < Formula
  desc "Fast Application for look your amazing emojis write in Rust"
  homepage "https://github.com/SergioRibera/Simplemoji"
  version "1.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.0/simplemoji-aarch64-apple-darwin.tar.xz"
      sha256 "6457e763e6ec7bc151b4654a8b67238fabe34a6390ff7fc368a399fc9ff0e48b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.0/simplemoji-x86_64-apple-darwin.tar.xz"
      sha256 "29bcf96b5e60cfb638b475c5a49ae310f1ce433eac7d24ac570a05909d64f96f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.0/simplemoji-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "79443ca16a0e69b98202bf67082bbe46760e29bdae90eb54a3956748bf29907d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.0/simplemoji-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d47733a43e578c27b2ab9aadf4dec6cd01580dba085feb635a0dc71389f0ef5a"
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
