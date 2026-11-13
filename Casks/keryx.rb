cask "keryx" do
  version "0.1.9"
  sha256 "a8bf18e89e9fa47d32211c86fc0caa22ddc6e3e67636ad8cf1e5f3476c5f331b"

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
