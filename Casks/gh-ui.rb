cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.24.1"
  sha256 arm:   "c11254fe2de13bd55a244c94bdaf6800da31d42f1c9b6f1b92b3cd5388314588",
         intel: "9c3f0ba343f93392e35789b36b74db1683d53779662f798efa040bf76886ff9a"

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
