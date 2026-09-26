cask "redline" do
  version "0.1.9"
  sha256 "2ef6ff869dde363723a0878722f939daede04d56f2350ccef3b7bc193938c192"

  url "https://github.com/croutoncreations/redline/releases/download/v#{version}/Redline-0.1.9-universal.dmg"
  name "Redline"
  desc "Spends spare Codex and Claude subscription quota on queued agent jobs"
  homepage "https://github.com/croutoncreations/redline"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Redline.app"
  binary "#{appdir}/Redline.app/Contents/Resources/bin/redline"

  uninstall quit: "ai.redline.mac"

  zap trash: [
    "~/Library/Application Support/Redline",
    "~/Library/Logs/Redline",
    "~/Library/Preferences/ai.redline.mac.plist",
  ]

  caveats <<~EOS
    Redline installs a signed, notarized menu-bar app. Automatic dispatch is
    off until you enable it in the app.

    This cask links the app's bundled CLI as "redline". The standalone
    formula (brew install croutoncreations/tap/redline) installs its own
    "redline"; install one or the other, not both.
  EOS
end
