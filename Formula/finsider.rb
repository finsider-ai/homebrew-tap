class Finsider < Formula
  desc "Financial intelligence CLI and MCP companion"
  homepage "https://finsider.ai"
  url "https://github.com/finsider-ai/releases/releases/download/v1.1.0/finsider-cli-1.1.0.tgz"
  sha256 "a2b403576c5befd23a5cd00bdb858e689c8ff83520f81cc61f8c851cae550aed"
  license "MIT"

  # The CLI needs Node 22+; Homebrew's current node satisfies it.
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal "1.1.0", shell_output("#{bin}/finsider --version").strip
    assert_match "finsider mcp config", shell_output("#{bin}/finsider --help")
  end
end
