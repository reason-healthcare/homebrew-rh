class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.6/rh-aarch64-apple-darwin.tar.gz"
      sha256 "9d53f85a6a3746419f3d36c0242a727b5b1fb2f977103b8a6a9446e090605da4"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.6/rh-x86_64-apple-darwin.tar.gz"
      sha256 "57c8d6131603a9bfeae6496dcfbad515c9bf2320b20a3fbc3f5881ec691a79ff"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.6/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7d536057b9cae23dc215cbd42a869ecb1aa190787c462e1342844d51ed4f76d4"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end
