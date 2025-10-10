class Xvn < Formula
  desc "Automatic Node.js version switching - 2-3x faster than avn"
  homepage "https://github.com/cameronolivier/xvn"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameronolivier/xvn/releases/download/v1.4.1/xvn-aarch64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/cameronolivier/xvn/releases/download/v1.4.1/xvn-x86_64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
