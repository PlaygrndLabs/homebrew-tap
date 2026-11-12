cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.17.0"
  sha256 arm:   "1c6657dc33ad8ebc53a6835b85607f7363953008870acb90e2968149b6f0f2c6",
         intel: "2f3d1cded6d0ae9ca019dc90839c63ac43f115c5e4bb9ec742fc53b4d28df6ce"

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
