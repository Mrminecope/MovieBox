class MovieboxTui < Formula
  VERSION = "0.1.29"
  MACOS_SHA256 = "294fb4163a169e0986ead099766517793183caaedf74a69fee130320e37ea542"
  LINUX_X64_SHA256 = "b5acc47489b9bbb6e8dbb3da4a7517faaf889c2dc70836023b36fae9de428047"
  LINUX_ARM64_SHA256 = "7140c77fbf57df1e3245f19f1c28f38b6a7f14e69c477142303058ed3afeaf0e"

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
