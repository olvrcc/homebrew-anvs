class Xvn < Formula
  desc "Automatic Node.js version switching - 2-3x faster than avn"
  homepage "https://github.com/olvrcc/xvn"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olvrcc/xvn/releases/download/v1.5.0/xvn-aarch64-apple-darwin.tar.gz"
      sha256 "ffb711761e1d62736e622c1e44f81c1f90000e62e2ab5ad8393f13e6a620283e"
    else
      url "https://github.com/olvrcc/xvn/releases/download/v1.5.0/xvn-x86_64-apple-darwin.tar.gz"
      sha256 "38b804035e1bccb1efd85879ea99216b74681e0cefaeb2324c10a56fcdec4d50"
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
