class Xvn < Formula
  desc "Automatic Node.js version switching - 2-3x faster than avn"
  homepage "https://github.com/olvrcc/xvn"
  version "1.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olvrcc/xvn/releases/download/v1.4.2/xvn-aarch64-apple-darwin.tar.gz"
      sha256 "80060c4cd1623cbcd91cdc7f0d019df3cb31fa5aea8ed36c3c8bc1cf205adca9"
    else
      url "https://github.com/olvrcc/xvn/releases/download/v1.4.2/xvn-x86_64-apple-darwin.tar.gz"
      sha256 "35488a0c8fd13a36f313bac75f9c08d74422f37896c44c5ffe9420d2585ad656"
    end
  end

  def install
    bin.install "xvn"
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
