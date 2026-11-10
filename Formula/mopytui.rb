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
      url "https://github.com/prietus/mopytui/releases/download/v0.2.7/mopytui-macos-arm64.tar.gz"
      sha256 "a192d8ea3c09ea765a5363f7c2308c0cdac0c60cbbf4176da69f5c6a8f2ee5db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prietus/mopytui/releases/download/v0.2.7/mopytui-linux-x86_64.tar.gz"
      sha256 "95a6e4f20a71ac11cee64c1c318e0774f9f65436c8243162f1c23014697aa8ed"
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
