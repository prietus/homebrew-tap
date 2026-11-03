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
      url "https://github.com/prietus/mopytui/releases/download/v0.2.5/mopytui-macos-arm64.tar.gz"
      sha256 "75aa1886010508afaf91c5957b17bbe4dd789cadf4fa4db2ef0f280ce448e347"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prietus/mopytui/releases/download/v0.2.5/mopytui-linux-x86_64.tar.gz"
      sha256 "b47852c104371de6f0a5a41c7581f9bf6c61f29490ecf556eafb701ba5132f79"
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
