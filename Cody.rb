class Cody < Formula
  desc "Assistant for quickly passing existing code context to LLMs"
  homepage "https://github.com/yhzion/cody"
  url "https://github.com/yhzion/cody/releases/download/v1.0.0/Cody-1.0.0-universal.dmg"
  sha256 "5c990f8ee757f320c42a52e3ec5a109ea5bf68dde09f3ee2be94952f999a8571"
  version "1.0.0"

  def install
    bin.install "Cody"
  end
end