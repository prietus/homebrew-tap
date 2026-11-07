cask "keryx" do
  version "0.1.4"
  sha256 "4782a82acc74aee754702d04ccdc95b53f4902a3b350ba61181c148afe06333a"

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
