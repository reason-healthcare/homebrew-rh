class Rh < Formula
  desc "Unified CLI for FHIR processing tools"
  homepage "https://github.com/reason-healthcare/rh"
  version "0.2.0-beta.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.0-beta.2/rh-aarch64-apple-darwin.tar.gz"
      sha256 "42b98e6e4e2d1c45d117c71fd8befe4584ec956b2810ab49a83de9fc1077b9fe"
    else
      url "https://github.com/reason-healthcare/rh/releases/download/v0.2.0-beta.2/rh-x86_64-apple-darwin.tar.gz"
      sha256 "b2f9f2d2827671af87b8a547188f4825f7bca1bf90ba295cc2037f7ddf3d511c"
    end
  end

  on_linux do
    url "https://github.com/reason-healthcare/rh/releases/download/v0.2.0-beta.2/rh-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fee5e42744ecae5c3dd31bce076d0b3bbc8c79a568f1078a3f4a716f60f8170e"
  end

  def install
    bin.install "rh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rh --version")
  end
end