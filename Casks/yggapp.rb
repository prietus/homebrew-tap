cask "yggapp" do
  version "0.1.2"
  sha256 "139a05861d60b10a4903cf418d63b269128265630fd92b2ddac2d6b2efdfab69"

  url "https://github.com/prietus/yggapp/releases/download/v#{version}/YggApp-#{version}.dmg"
  name "YggApp"
  desc "Menu bar client for the Yggdrasil mesh network"
  homepage "https://github.com/prietus/yggapp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "YggApp.app"

  uninstall quit: "com.prietus.yggapp.mac"

  zap trash: [
    "~/Library/Application Scripts/com.prietus.yggapp.mac",
    "~/Library/Containers/com.prietus.yggapp.mac",
    "~/Library/Group Containers/LFTD9T269J.com.prietus.yggapp",
  ]

  caveats <<~EOS
    YggApp runs in the menu bar. On first launch macOS asks you to allow its
    network extension in System Settings > General > Login Items & Extensions,
    and the first connection asks to add a VPN configuration.

    The tunnel is a system extension, so YggApp must stay in /Applications.
    To remove the extension and the VPN profile completely, quit YggApp and
    move it to the Trash from Finder (which unloads the extension) before or
    instead of `brew uninstall`, then delete "YggApp" in System Settings > VPN.
  EOS
end
