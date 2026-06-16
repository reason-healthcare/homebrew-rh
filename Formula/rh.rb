class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "${VERSION}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v${VERSION}/rh-aarch64-apple-darwin.tar.gz"
      sha256 "${SHA_ARM64_MACOS}"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v${VERSION}/rh-x86_64-apple-darwin.tar.gz"
      sha256 "${SHA_X86_MACOS}"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v${VERSION}/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "${SHA_X86_LINUX}"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/rh --version")
  end
end
