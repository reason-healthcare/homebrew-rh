class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.3.0/rh-aarch64-apple-darwin.tar.gz"
      sha256 "9e0e7cabe6e93f0e3cc92ae2b971e9d6033570a926c19cddba048268646d473a"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.3.0/rh-x86_64-apple-darwin.tar.gz"
      sha256 "00213acd93d76174662056d584900e0946ce0f51873562c48f97b627092326c6"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.3.0/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "36db89e87d785289df11a04aa4c201a634a5603f10299559c51924e5bafeb796"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
