cask "drtagger" do
  version "0.1.6"
  sha256 "a5f71317e64bfb58db6c2874fb486884b20d1c05add33a3e36659739958c74bb"

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
