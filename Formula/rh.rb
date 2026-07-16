class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.7/rh-aarch64-apple-darwin.tar.gz"
      sha256 "a63f6b552b0be59b831dcdd5b3c57e73655da9ff9ac6013cd00836f333319958"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.7/rh-x86_64-apple-darwin.tar.gz"
      sha256 "3a7c84fa6bab8bf5c61a2142737b3c2717d1604739857aa5cbb03f16b30542d9"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.7/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a1d64218c55aa2622f33191b3e5cb2d419f4f320532a72f9a9123852702d1da2"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
