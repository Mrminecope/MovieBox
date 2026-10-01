class Moviebox < Formula
  VERSION = "0.1.27"
  MACOS_SHA256 = "21e229eddf1868a97fc83c16434ed73f2dfd7af5876e8a1e7eec0ea0851f322b"
  LINUX_X64_SHA256 = "d95195f0fb97763ad2d8f4c94d4004c1922fcd31ababce576683cb4ef355abc1"
  LINUX_ARM64_SHA256 = "6972adba633b51d9c088692df12a179320290a71070e92d0b8b94c371ebc357f"

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
    bin.install "moviebox"
  end

  test do
    system "#{bin}/moviebox", "--version"
  end
end
