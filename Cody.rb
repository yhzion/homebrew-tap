class Cody < Formula
  desc "Assistant for quickly passing existing code context to LLMs"
  homepage "https://github.com/yhzion/cody"
  url "https://github.com/yhzion/cody/releases/download/v1.0.0/Cody-1.0.0-universal.dmg"
  sha256 "a386708ab8b79d75b20b9822762064ff6c1c913016263ea93ee4c65241fdbe07" # Cody-1.0.0-universal.dmg 파일의 정확한 SHA256 해시값을 입력하세요.
  version "1.0.0"

  def install
    # 다운로드된 DMG 파일을 시스템에 마운트합니다.
    system "hdiutil", "attach", "#{cached_download}"

    # 마운트된 볼륨에서 .app 파일을 /usr/local/Cellar/아래의 적절한 위치로 복사합니다.
    system "cp", "-r", "/Volumes/Cody/Cody.app", "#{prefix}/Cody.app"

    # 마운트된 볼륨을 안전하게 분리합니다.
    system "hdiutil", "detach", "/Volumes/Cody"

    # 실행 파일에 대한 심볼릭 링크를 생성하여 사용자가 터미널에서 'cody' 명령어로 앱을 실행할 수 있도록 설정합니다.
    bin.install_symlink "#{prefix}/Cody.app/Contents/MacOS/Cody" => "cody"
  end

  def caveats
    <<~EOS
      Cody has been installed. You can run it by typing `cody` in your terminal.
    EOS
  end

  # 해당 소프트웨어의 실행 파일을 테스트합니다.
  test do
    system "#{bin}/cody", "--version"
  end
end
