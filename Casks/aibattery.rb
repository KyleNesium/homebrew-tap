cask "aibattery" do
  version "2.6.1"
  sha256 "2d4bbcdec5c40f12505e95069c4ad586d67ee2559fbc93af4487807800f8b7d9"

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
