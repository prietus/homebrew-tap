cask "drtagger" do
  version "0.1.10"
  sha256 "bbc62cad413cc2025300eeb2546f7fe9cf33ae59b78c23255b8061a28e7d5851"

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
