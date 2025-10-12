class Xvn < Formula
  desc "Automatic Node.js version switching - 2-3x faster than avn"
  homepage "https://github.com/olvrcc/xvn"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olvrcc/xvn/releases/download/v1.5.0/xvn-aarch64-apple-darwin.tar.gz"
      sha256 "10d894c0c367c5c71c22dc57d4b20e3576b1eeed8ce0b9ff2309b441957d4e02"
    else
      url "https://github.com/olvrcc/xvn/releases/download/v1.5.0/xvn-x86_64-apple-darwin.tar.gz"
      sha256 "91d79761591c3f8d8e7cd307ecfcedb7b4de48a0898ef699d46bf6a70c647b00"
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
