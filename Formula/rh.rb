class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.2/rh-aarch64-apple-darwin.tar.gz"
      sha256 "b0abbb8008b1d65869f6b7b925df0eb66a4ad82a2ac37bf6b06371cab83a3047"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.2/rh-x86_64-apple-darwin.tar.gz"
      sha256 "bef1b0ec3867321e88990ec9e6f71db620d4c825471d2aadb1a3228b0c4739f5"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.2/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4f3397d841edd02c8129c4a7871bdb0a5ac979a1b197a1fe31c989c3f73b836b"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
