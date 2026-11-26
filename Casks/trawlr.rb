cask "trawlr" do
  version "0.1.0"
  sha256 "b84336466aab907f77f24dc4973d2e01fcfd925840e2a1a6c7ea4db2411610c9"

  url "https://github.com/SamuelCGilbert/trawlr/releases/download/v#{version}/trawlr-#{version}-macos.pkg"
  name "Trawlr"
  desc "Instant file name search with an always-current index"
  homepage "https://github.com/SamuelCGilbert/trawlr"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  pkg "trawlr-#{version}-macos.pkg"

  # The daemon saves its index as it stops; --uninstall-service waits for that.
  uninstall early_script: {
              executable: "/Applications/Trawlr.app/Contents/MacOS/trawlrd",
              args:       ["--uninstall-service"],
              sudo:       true,
            },
            launchctl:    "io.trawlr.trawlrd",
            quit:         "io.trawlr.Trawlr",
            pkgutil:      "io.trawlr.Trawlr",
            delete:       "/usr/local/bin/trawlr"

  zap trash: [
    "/Library/Application Support/Trawlr",
    "/Library/Logs/Trawlr",
    "~/Library/LaunchAgents/io.trawlr.Trawlr.plist",
    "~/Library/Preferences/io.trawlr.trawlr.plist",
  ]

  caveats <<~EOS
    To list Desktop, Documents, Downloads and other private folders, the
    daemon needs Full Disk Access: in System Settings > Privacy & Security >
    Full Disk Access, click +, press Shift-Cmd-G and add
      /Applications/Trawlr.app/Contents/MacOS/trawlrd
    macOS forgets this after each update; switch it off and on again then.
  EOS
end
