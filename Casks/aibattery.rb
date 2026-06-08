cask "aibattery" do
  version "2.4.3"
  sha256 "6e68d08b2e9fad45e9fb5937366fbe6362d355c5ba51a4a69d4d564d113e086c"

  url "https://github.com/KyleNesium/AIBattery/releases/download/v#{version}/AIBattery.zip"
  name "AI Battery"
  desc "Claude Code rate limits, context health, and token usage in your menu bar"
  homepage "https://github.com/KyleNesium/AIBattery"

  depends_on macos: :ventura

  app "AIBattery.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/AIBattery.app"]
  end

  zap trash: "~/Library/Preferences/com.KyleNesium.AIBattery.plist"

  caveats <<~EOS
    AI Battery requires a Claude Code subscription with API access.

    On first launch:
    1. macOS may block the app — open System Settings → Privacy & Security → Open Anyway
    2. Click "Always Allow" when prompted for Keychain access
  EOS
end
