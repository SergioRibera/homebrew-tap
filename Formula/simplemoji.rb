class Simplemoji < Formula
  desc "Fast Application for look your amazing emojis write in Rust"
  homepage "https://github.com/SergioRibera/Simplemoji"
  version "0.2.1"
  if OS.mac?
    url "https://github.com/SergioRibera/Simplemoji/releases/download/v0.2.1/simplemoji-x86_64-apple-darwin.tar.xz"
    sha256 "1ace7d9dbcae96e35e97b9c6cde90f5471ce52d3cf774b362ce9ffc76799bf4d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/SergioRibera/Simplemoji/releases/download/v0.2.1/simplemoji-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "4cf0686704bbb4c4eb10c3490847c1ebe85a911a0c6fa3d14cf99d20a132fdca"
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
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
