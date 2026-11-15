cask "irkt" do
  version "0.3.20"
  sha256 "95af8fa03059659de6b2de6005a1ab833d091f258d903a5d9950c12faf34d2c6"

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
