class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.3/rh-aarch64-apple-darwin.tar.gz"
      sha256 "f9393a928032f654b291040d43e933223dbb06c72b77bd097b0e26fbfdb8ef53"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.3/rh-x86_64-apple-darwin.tar.gz"
      sha256 "0470b7af7a72b637bb9a20109116e371891b0566d1b18480f151dfe3aee08e91"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.3/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9c2c44b4bb84d2b8e3c5355a158d8bfe4b2e91760bfb704926b8c8dfccc31566"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
