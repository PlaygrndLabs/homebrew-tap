cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.12.0"
  sha256 arm:   "b8150f03f328b59b8cf1c40bfb7ec6d2941d505fb7a3bca6083fa4e99fb83826",
         intel: "0feb80ad9d017e22e1b19fe0c71e44f03dba6b79a6a225b2f856a36edb183ce9"

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
