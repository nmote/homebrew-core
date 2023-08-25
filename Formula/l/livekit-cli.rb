class LivekitCli < Formula
  desc "Command-line interface to LiveKit"
  homepage "https://livekit.io"
  url "https://github.com/livekit/livekit-cli/archive/refs/tags/v1.2.10.tar.gz"
  sha256 "ea3d76abdbc458b22efc2a5bfc294ddc17fe7a329936c054f1f292b0c87d455f"
  license "Apache-2.0"
  head "https://github.com/livekit/livekit-cli.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "150c05c77a8faa323ba661e05e11209dce9b61bc48704c72ba9bd7877af6ab9b"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d9913b8b1a6a63af7aa178bbc8ab3d028c00e9e238d84952417c7b721c79937b"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "bb3d54fe284f97e5d66c63d5b09c5b8b1f2765091f248885821fb2ae706c234b"
    sha256 cellar: :any_skip_relocation, ventura:        "588cc2f06d4e407c42a4f41eeb7d00acd743749e24dd97393008b36fdc9d9a24"
    sha256 cellar: :any_skip_relocation, monterey:       "583d365aa80e21d74c350b037082b74c9b8bd03add9c2a057145d987cda2bc5a"
    sha256 cellar: :any_skip_relocation, big_sur:        "da575131ea4d035b43e70d74219d5cfd5a64c68521a3af308f94b19eec98176d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a1689673ffafa56522c56aa892915be38b4b587443757049ac4942b7bc2e72d9"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/livekit-cli"
  end

  test do
    output = shell_output("#{bin}/livekit-cli create-token --list --api-key key --api-secret secret")
    assert output.start_with?("valid for (mins):  5")
    assert_match "livekit-cli version #{version}", shell_output("#{bin}/livekit-cli --version")
  end
end
