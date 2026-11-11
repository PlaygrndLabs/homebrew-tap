cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.16.2"
  sha256 arm:   "0fed5d220a332f0c54c49380f9b72683990fa4fe9c1b7a5eb8a14665d87c9a46",
         intel: "5e6b0a8bcf4e1e1ae92802f75b90fb7a37d9a0ca0dd04583f56a5b00b7701751"

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
