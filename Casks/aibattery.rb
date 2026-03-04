cask "aibattery" do
  version "1.6.6"
  sha256 "f2f3855c9a6add95bf22ba43a410f393aeeccde7955c6d0136ebd6f05345fe10"

  url "https://github.com/KyleNesium/AIBattery/releases/download/v#{version}/AIBattery.zip"
  name "AI Battery"
  desc "Battery meter for Claude Code — rate limits, context health, and token usage in your menu bar"
  homepage "https://github.com/KyleNesium/AIBattery"

  depends_on macos: ">= :ventura"

  app "AIBattery.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/AIBattery.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.KyleNesium.AIBattery.plist",
  ]

  caveats <<~EOS
    AI Battery requires a Claude Code subscription with API access.

    On first launch:
    1. macOS may block the app — open System Settings → Privacy & Security → Open Anyway
    2. Click "Always Allow" when prompted for Keychain access
  EOS
end
