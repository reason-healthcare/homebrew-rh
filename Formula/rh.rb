class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.1/rh-aarch64-apple-darwin.tar.gz"
      sha256 "7450515410956d66d7b672be5c492926e2cbd470ab2519f251d6e4715f685bd4"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.1/rh-x86_64-apple-darwin.tar.gz"
      sha256 "eabcbf8093594976c87f189aabc6a837c026ec3517ddb7eef05b40f45cce22ec"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.1/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "aad166b2f09d97dc744f34c59cebc6373ebb212f6b0ae1a690728d0091602544"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
