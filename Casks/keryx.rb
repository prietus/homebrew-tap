cask "keryx" do
  version "0.1.8"
  sha256 "5c762c7330c98b553f090c915e77f54c060a4cd8733314cd8d878b727d569a5c"

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
