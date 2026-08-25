class Finsider < Formula
  desc "Financial intelligence CLI and MCP companion"
  homepage "https://finsider.ai"
  url "https://github.com/finsider-ai/releases/releases/download/v1.0.0/finsider-cli-1.0.0.tgz"
  sha256 "6047698d449bd46d018813f81f8a80540ccfd1ab4641718196d1476f10c59e60"
  license "MIT"

  # The CLI needs Node 22+; Homebrew's current node satisfies it.
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal "1.0.0", shell_output("#{bin}/finsider --version").strip
    assert_match "finsider mcp config", shell_output("#{bin}/finsider --help")
  end
end
