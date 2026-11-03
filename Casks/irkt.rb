cask "irkt" do
  version "0.3.19"
  sha256 "c948c5af05057b0e3e70947b3ae59051ec9d01a68f1a02a84ce572d245f534de"

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
