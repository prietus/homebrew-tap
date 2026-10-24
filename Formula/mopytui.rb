class Mopytui < Formula
  desc "Terminal client for Mopidy with cover art, Tidal, lyrics and listening stats"
  homepage "https://github.com/prietus/mopytui"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/prietus/mopytui/releases/download/v0.2.4/mopytui-macos-arm64.tar.gz"
      sha256 "4ea6c34d4e8d67c304f7f8957f15d323ebdfbb20a188639a05163f37d675d022"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prietus/mopytui/releases/download/v0.2.4/mopytui-linux-x86_64.tar.gz"
      sha256 "03a3e00761097afb7026ed9c9fcb8655244ad745f1898e2c95e14ec613de73e5"
    end
  end

  def install
    bin.install "mopytui"
  end

  def caveats
    <<~EOS
      mopytui talks to a running Mopidy server (mopidy-http and mopidy-mpd):

        mopytui --host 192.168.1.10 --port 6680

      Extras such as Tidal reviews, radio and listening stats need the
      mopidy-goodies extension on the server:
        https://github.com/prietus/mopidy-goodies
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mopytui --version")
  end
end
