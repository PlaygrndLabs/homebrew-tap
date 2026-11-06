cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "24f5fe310db52c7e9e0a65840c19062c5cd34620f4a7465dab93be4fd8f5dd07",
         intel: "0e0721ba76ea2771f8f215dd99ac1f21f5b41a16bf0faf7de493db1dfc8388ce"

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
