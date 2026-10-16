class Moviebox < Formula
  VERSION = "0.1.28"
  MACOS_SHA256 = "9e5db018dba24afbd8d5a6e0ce83c756baeb93f197a5f8a1199f3d8ecb7ccece"
  LINUX_X64_SHA256 = "99d0daf0c2a88b5e33f6ba47b25c47a92f8551058958ef485b3cc5c81e384a34"
  LINUX_ARM64_SHA256 = "4f82291eab64ca52541a1580a6c7eecd17f93287e1617e39c35b2560a0743d2e"

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
