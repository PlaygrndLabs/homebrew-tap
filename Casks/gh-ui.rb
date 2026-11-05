cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "3863f5c98b2fed514f04b23cca0640503a18e751d972c5cc70499ffd42d7442f",
         intel: "872ec252f8560e45a3cfe8e264956e3d2a3206205560fbe2c2961593730c1a3d"

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
