class MovieboxTui < Formula
  VERSION = "0.1.30"
  MACOS_SHA256 = "917928a76bddc422fedfaca7b7ec30822f8ad821d059dba8657f013244261d26"
  LINUX_X64_SHA256 = "6a216cc65a6d4c9c4432e4b87ac18faee72d2b60239344baa78083e5f4fccf42"
  LINUX_ARM64_SHA256 = "091e17311462e62ca54c20459f2c810b74856bd6c54af4b73357aa4185a0b5dc"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/Mrminecope/MovieBox"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/Mrminecope/MovieBox/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Mrminecope/MovieBox/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/Mrminecope/MovieBox/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox" => "moviebox-tui"
    bin.install_symlink bin / "moviebox-tui" => "moviebox"
  end

  test do
    system "#{bin}/moviebox", "--version"
  end
end
