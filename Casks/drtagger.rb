cask "drtagger" do
  version "0.1.8"
  sha256 "ae640e0972a12ea4b4af6e949f007b37f01471879eee3bb947014effcf2e1abc"

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
