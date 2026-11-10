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
      url "https://github.com/prietus/mopytui/releases/download/v0.2.6/mopytui-macos-arm64.tar.gz"
      sha256 "97e74a98989f8e93c8cdcfc3c7341b8725529c7fd30a3fff626c84ca36447144"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prietus/mopytui/releases/download/v0.2.6/mopytui-linux-x86_64.tar.gz"
      sha256 "072b4f103e43919a71b22b2cfcddd81fd81daf9b636ca7d0359dfabc2c083228"
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
