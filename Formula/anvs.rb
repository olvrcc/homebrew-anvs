class Anvs < Formula
  desc "Automatic Node.js version switching - 2-3x faster than avn"
  homepage "https://github.com/olvrcc/anvs"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olvrcc/anvs/releases/download/v2.0.0/anvs-aarch64-apple-darwin.tar.gz"
      sha256 "TO_BE_UPDATED_AFTER_RELEASE"
    else
      url "https://github.com/olvrcc/anvs/releases/download/v2.0.0/anvs-x86_64-apple-darwin.tar.gz"
      sha256 "TO_BE_UPDATED_AFTER_RELEASE"
    end
  end

  def install
    bin.install "anvs"
    lib.install "lib/anvs.sh"
  end

  def caveats
    <<~EOS
      To set up anvs shell integration, run:
        anvs setup

      Then restart your shell or run:
        source ~/.bashrc  # or ~/.zshrc

      anvs requires a Node.js version manager (nvm or fnm) to be installed.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anvs --version")
  end
end
