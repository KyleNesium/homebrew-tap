cask "aibattery" do
  version "3.1.0"
  sha256 "c79702b7eae1f0a4903c21550c7499dc4a15819ed1c79c05fb3a87389688b357"

  url "https://github.com/KyleNesium/AIBattery/releases/download/v#{version}/AIBattery.zip"
  name "AI Battery"
  desc "Claude Code rate limits, context health, and token usage in your menu bar"
  homepage "https://github.com/KyleNesium/AIBattery"

  depends_on macos: :ventura

  app "AIBattery.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-cr", "{{appdir}}/AIBattery.app"],
        writable_paths: ["AIBattery.app"],
        writable_base:  :appdir
  end

  zap trash: "~/Library/Preferences/com.KyleNesium.AIBattery.plist"

  caveats <<~EOS
    AI Battery requires a Claude Code subscription with API access.

    On first launch:
    1. macOS may block the app — open System Settings → Privacy & Security → Open Anyway
    2. Click "Always Allow" when prompted for Keychain access
  EOS
end
