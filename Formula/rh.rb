class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.4/rh-aarch64-apple-darwin.tar.gz"
      sha256 "44ae70e9205be10c208e34532f8c987e2433b9c8a8c96075d0de7e2c323adcb6"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.4/rh-x86_64-apple-darwin.tar.gz"
      sha256 "f05c757846657745859fc57eb65a62c3e86b2bde4f4bd4187da2b782d71b7d4a"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.4/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "634b79e449ff68c3e4f4fbf66fc56a34cfe2d59d1aeafd40f3df0bae165d8de6"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
