class MovieboxTui < Formula
  VERSION = "0.1.27"
  MACOS_SHA256 = "06b93fc0f4dda6f6939502bab5530d44b3d238719a72407378eac74eae1e3db8"
  LINUX_X64_SHA256 = "c816c58cb1b92d484df0468e9de8a7a794bcf6534586cac260d97119920a9254"
  LINUX_ARM64_SHA256 = "fc7b4cc8e7beddf59bce401a8fea2092e0ef9cad94e1c434c613df16ca1a7613"

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
