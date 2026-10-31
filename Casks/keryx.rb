cask "keryx" do
  version "0.1.1"
  sha256 "f66756591593f894b6012835a9e2ea0bef3c9e80e53af0718df30f17feac4f65"

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
