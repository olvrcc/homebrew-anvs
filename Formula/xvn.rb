class Xvn < Formula
  desc "Automatic Node.js version switching - 2-3x faster than avn"
  homepage "https://github.com/olvrcc/xvn"
  version "1.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olvrcc/xvn/releases/download/v1.6.1/xvn-aarch64-apple-darwin.tar.gz"
      sha256 "d0d53872ad8d68c7ad50fee0a23717fda2617852a909407a8b44a31521d82751"
    else
      url "https://github.com/olvrcc/xvn/releases/download/v1.6.1/xvn-x86_64-apple-darwin.tar.gz"
      sha256 "19b4b1f8bf97a375d097ee66d46c0025b3e5eb0e51dd41f186f6c961b8434edb"
    end
  end

  def install
    bin.install "xvn"
    lib.install "lib/xvn.sh"
  end

  def caveats
    <<~EOS
      To set up xvn shell integration, run:
        xvn setup

      Then restart your shell or run:
        source ~/.bashrc  # or ~/.zshrc

      xvn requires a Node.js version manager (nvm or fnm) to be installed.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xvn --version")
  end
end
