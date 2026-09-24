cask "drtagger" do
  version "0.1.3"
  sha256 "3d227d47f0dca54e8a07b2fbbb8e5afb64dd426385dbb2d6622b9728fa467f5b"

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
