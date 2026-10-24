cask "irkt" do
  version "0.3.18"
  sha256 "fcd8a822da077fe000558a469898b98e9cd24f7283d54c49dac376c4c571260b"

  url "https://github.com/prietus/irkt/releases/download/v#{version}/irkt-v#{version}-macos-arm64.zip"
  name "irkt"
  desc "Terminal IRC client with IRCv3, SASL and inline images"
  homepage "https://github.com/prietus/irkt"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  binary "release/irkt"

  # config.toml (with your credentials), state.toml, irkt.log, dicts/.
  zap trash: "~/Library/Application Support/irkt"
end
