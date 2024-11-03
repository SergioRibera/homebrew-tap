class SssCode < Formula
  desc "Take pretty screenshots of your code"
  homepage "https://github.com/SergioRibera/sss"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.2.0/sss_code-aarch64-apple-darwin.tar.xz"
      sha256 "562e4ccb43f802d63e52d3e13fe3764360328b805917a1fe4b81dca8334b116f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.2.0/sss_code-x86_64-apple-darwin.tar.xz"
      sha256 "6d20e1d7768201c5475e49fd41109397cc1fa412dc9f07ab44bcf6570669d167"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/SergioRibera/sss/releases/download/sss_code/v0.2.0/sss_code-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "f97f8a8d429290595413f05cf3e4f1ff0887929c5ef30afd0424e36bd671b762"
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
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
    bin.install "sss_code" if OS.mac? && Hardware::CPU.arm?
    bin.install "sss_code" if OS.mac? && Hardware::CPU.intel?
    bin.install "sss_code" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
