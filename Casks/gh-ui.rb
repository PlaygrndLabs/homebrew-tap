cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "ad0d652677ebf1bcc3cddd0e3dab68c36396cb87ff63017d33edc14c82b49ea7",
         intel: "3aa11c4dcc610165dbc158b2a31cb761de3b8c679c4b7f5f05b3622cf93e9025"

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
