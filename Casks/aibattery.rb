cask "aibattery" do
  version "2.0.8"
  sha256 "0e53005af45ee56946a866b8b2a1de74b4ecedf21ff57fdd539d43d275f0d1b4"

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
