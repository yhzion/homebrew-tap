class Cody < Formula
  desc "Assistant for quickly passing existing code context to LLMs"
  homepage "https://github.com/yhzion/cody"
  url "https://github.com/yhzion/cody/releases/download/v1.0.0/Cody-1.0.0-universal.dmg"
  sha256 "5c990f8ee757f320c42a52e3ec5a109ea5bf68dde09f3ee2be94952f999a8571" # dmg 파일의 SHA256 해시값을 입력합니다.
  version "1.0.0"

  def install
    # 일반적으로 `dmg` 파일 설치 시에는 `installer` 메서드를 사용합니다.
    system "hdiutil", "attach", "Cody-1.0.0-universal.dmg"
    system "cp", "-r", "/Volumes/Cody/Cody.app", "#{prefix}/Cody.app"
    system "hdiutil", "detach", "/Volumes/Cody"
    bin.install_symlink "#{prefix}/Cody.app/Contents/MacOS/Cody" => "cody"
  end

  def caveats
    <<~EOS
      Cody has been installed. You can run it by typing `cody` in your terminal.
    EOS
  end
end
