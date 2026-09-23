cask "borgmac" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/prietus/borg/releases/download/v#{version}/BorgMac-#{version}.zip"
  name "BorgMac"
  desc "Native macOS client for Borg backup repositories (BorgBase, BorgBox, SSH, local)"
  homepage "https://borgmac.priet.us/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on formula: "borgbackup"

  app "BorgMac.app"

  zap trash: [
    "~/Library/Application Support/BorgMac",
    "~/Library/Caches/BorgMac",
    "~/Library/LaunchAgents/com.carlos.BorgMac.backup.*.plist",
    "~/Library/Logs/BorgMac",
  ]

  caveats <<~EOS
    Scheduled backups are launchd agents that point at /Applications/BorgMac.app.
    Before uninstalling, turn schedules off inside the app, or use
    `brew uninstall --zap borgmac` to remove them together with the app data.
  EOS
end
