cask "keryx" do
  version "0.1.2"
  sha256 "346316c0ddf1562ac16e6e42be245c922101fc7b0ea1c598ce62c382165d401b"

  url "https://github.com/prietus/keryx/releases/download/v#{version}/Keryx-v#{version}-macOS.zip"
  name "Keryx"
  desc "Native IRC client with IRCv3 and soju support"
  homepage "https://github.com/prietus/keryx"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Keryx.app"

  # Networks, scrollback, search index and preferences live in the sandbox
  # container. Passwords stay in the Keychain; scripts in Application Scripts
  # are yours and are left alone.
  zap trash: "~/Library/Containers/im.keryx.mac"
end
