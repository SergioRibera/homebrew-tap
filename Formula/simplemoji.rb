class Simplemoji < Formula
  desc "Fast Application for look your amazing emojis write in Rust"
  homepage "https://github.com/SergioRibera/Simplemoji"
  if Hardware::CPU.type == :arm
    url "https://github.com/SergioRibera/Simplemoji/releases/download/v0.2.0/simplemoji-aarch64-apple-darwin.tar.xz"
    sha256 "49d170d9cace17d912ba1ef418694d46d17c5dfbd5059fedb1d302b4305e671a"
  else
    url "https://github.com/SergioRibera/Simplemoji/releases/download/v0.2.0/simplemoji-x86_64-apple-darwin.tar.xz"
    sha256 "15cbd672c70e6cee71b93713f94c7edca88756a40fa85a9ff8e8c3423ef0af28"
  end
  version "0.2.0"
  license "MIT OR Apache-2.0"

  def install
    bin.install "simplemoji"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
