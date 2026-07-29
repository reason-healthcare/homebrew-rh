class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.8/rh-aarch64-apple-darwin.tar.gz"
      sha256 "11e1d0e190cc797fefe496b0edd0bd610224eff016e20cab2f9a2de0f7a0158b"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.8/rh-x86_64-apple-darwin.tar.gz"
      sha256 "423859ea29d9731db49026eaa8db84e23267370e971d1d956c617bd222a1cfe9"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.8/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4be35a3d55f23ea69bffec1335ff8d417b5d108cbe1a65ca96e51986776ea3c6"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
