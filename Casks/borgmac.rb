cask "borgmac" do
  version "1.7.0"
  sha256 "f0fcb800b40681354c3c85b4798443bbd3e0df71307b8793f2db9c22b29881a6"

  url "https://github.com/prietus/borg/releases/download/v#{version}/BorgMac-#{version}.zip"
  name "BorgMac"
  desc "Native client for Borg backup repositories (BorgBase, BorgBox, SSH and local)"
  homepage "https://borgmac.priet.us/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "BorgMac.app"

  zap trash: [
    "~/Library/Application Support/BorgMac",
    "~/Library/Caches/BorgMac",
    "~/Library/LaunchAgents/com.carlos.BorgMac.backup.*.plist",
    "~/Library/Logs/BorgMac",
  ]

  caveats <<~EOS
    BorgMac drives the `borg` command line tool, which is not installed by this cask
    because the two Homebrew formulae that provide it conflict with each other:

      brew install borgbackup         # standard
      brew install borgbackup-fuse    # same, plus FUSE support for mounting archives

    Scheduled backups are launchd agents that point at /Applications/BorgMac.app.
    Before uninstalling, turn schedules off inside the app, or use
    `brew uninstall --zap borgmac` to remove them together with the app data.
  EOS
end
