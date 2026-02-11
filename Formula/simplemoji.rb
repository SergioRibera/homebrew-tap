class Simplemoji < Formula
  desc "Fast Application for look your amazing emojis write in Rust"
  homepage "https://github.com/SergioRibera/Simplemoji"
  version "1.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.4/simplemoji-aarch64-apple-darwin.tar.xz"
      sha256 "62252a85a7d18045f49639ab5d189df24f7442bc1881be0649b20c5d117e293d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.4/simplemoji-x86_64-apple-darwin.tar.xz"
      sha256 "a372e7e136283c8210516d5dba76b4b9b02077adc537139af5b64154d4056542"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.4/simplemoji-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9e87b7c40a690d7ee1f607330d34eb93fb0d4eab70bfb610d4abaf3a5a8a9a63"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/Simplemoji/releases/download/v1.2.4/simplemoji-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4df9e2c78efe2a87c1bdefcb1873b4990776b0e8bf23bd574b9eda76f9688b0d"
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
