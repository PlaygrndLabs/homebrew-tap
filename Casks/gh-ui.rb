cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.22.1"
  sha256 arm:   "7d28bb059c8c68403a0d9b41274391cac1f34cf8d75b58c725e095754d1b191a",
         intel: "183d564434c0550a2480b9bd30b8d4b5c5917b92496ddc4a53f29ae8c6f30b4b"

  url "https://github.com/PlaygrndLabs/gh-ui/releases/download/v#{version}/GitHub-UI-#{arch}.dmg"
  name "GitHub UI"
  desc "GitHub client with a built-in code review agent"
  homepage "https://github.com/PlaygrndLabs/gh-ui"

  depends_on :macos

  # The bundle keeps its build name inside; this is the name people see in Applications and Spotlight.
  app "gh-ui.app", target: "GitHub UI.app"

  # GitHub UI is distributed outside Apple's notarization service.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/GitHub UI.app"]
  end
end
