class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.5/rh-aarch64-apple-darwin.tar.gz"
      sha256 "2302f8e2b0e66b51403a96b0dfbf3c54fabeb95c764d74dfccd70f94a6e4d261"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.5/rh-x86_64-apple-darwin.tar.gz"
      sha256 "bdcf2af04b3914d52fa31b83ece78d20abbae157257336446c806386d9d69896"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.5/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "14387b53f8d4a3cf07b95e32f16e6f3fa2cc3a1304ee42d2005be4c18881418a"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
