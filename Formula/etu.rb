class Etu < Formula
  desc "A personal command line journal"
  homepage "https://github.com/icco/etu"
  url "https://github.com/icco/etu/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "6cbc9826448e47362d7b51d4f8475a0dc8fb785663c77a50830743d56c5d6dbf"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/etu --version")
  end
end
