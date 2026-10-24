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
      url "https://github.com/prietus/mopytui/releases/download/v0.2.3/mopytui-macos-arm64.tar.gz"
      sha256 "cac2917d7dc91ede111592fd235fea938809f8971538271c334f048f3226a818"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prietus/mopytui/releases/download/v0.2.3/mopytui-linux-x86_64.tar.gz"
      sha256 "115d3d6a1b02dde8c7ae8f41cafcf56b92754b9df4464e9683b11991332a3b87"
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
