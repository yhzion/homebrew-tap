class Cody < Formula
  desc "Assistant for quickly passing existing code context to LLMs"
  homepage "https://github.com/yhzion/cody"
  url "https://github.com/yhzion/cody/releases/download/v1.0.0/Cody-1.0.0-universal.dmg"
  sha256 "a386708ab8b79d75b20b9822762064ff6c1c913016263ea93ee4c65241fdbe07"
  version "1.0.0"

  def install
    # DMG 파일을 마운트합니다.
    system "hdiutil", "attach", "#{cached_download}"

    # .app 파일을 적절한 위치로 복사합니다.
    system "cp", "-r", "/Volumes/Cody/Cody.app", "#{prefix}/Cody.app"

    # 마운트된 DMG 파일을 해제합니다.
    system "hdiutil", "detach", "/Volumes/Cody"

    # 심볼릭 링크를 생성하여 cody 명령어로 실행할 수 있도록 설정합니다.
    bin.install_symlink "#{prefix}/Cody.app/Contents/MacOS/Cody" => "cody"

    # 서명 없이 설치가 완료되도록 설정 (이미 서명 없이 설치되도록 설정됨)
  end

  def caveats
    <<~EOS
      Cody has been installed without code signing. You can run it by typing `cody` in your terminal.
    EOS
  end

  test do
    system "#{bin}/cody", "--version"
  end
end
