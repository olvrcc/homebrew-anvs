class Xvn < Formula
  desc "Automatic Node.js version switching - 2-3x faster than avn"
  homepage "https://github.com/olvrcc/xvn"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olvrcc/xvn/releases/download/v1.6.0/xvn-aarch64-apple-darwin.tar.gz"
      sha256 "d435ac6e69d249165c8a6523f43f66961594e0ab5194d64371764a9f7c913312"
    else
      url "https://github.com/olvrcc/xvn/releases/download/v1.6.0/xvn-x86_64-apple-darwin.tar.gz"
      sha256 "10b31a162e2bd58b6c5b46b576c2efc31f09731640df3ac67ebb610d35b4d3b3"
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
