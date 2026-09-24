cask "drtagger" do
  version "0.1.0"
  sha256 "ee29dbd5cb56d0fc0f835055839183215be8c7fa3c1f9684f8f1861b5990308e"

  url "https://github.com/prietus/drtagger-mac/releases/download/v#{version}/drtagger-#{version}.zip"
  name "drtagger"
  desc "Extract SACD ISOs, split CUE images and tag lossless music with the exact release"
  homepage "https://github.com/prietus/drtagger-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "drtagger.app"

  zap trash: [
    "~/Library/Application Support/drtagger",
    "~/Library/Caches/us.priet.drtagger-mac",
    "~/Library/Preferences/us.priet.drtagger-mac.plist",
    "~/Library/Saved Application State/us.priet.drtagger-mac.savedState",
  ]
end
