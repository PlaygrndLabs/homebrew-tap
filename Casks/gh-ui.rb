cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.14.0"
  sha256 arm:   "ad60a5dbd635da075387b6b925fd35eca3d2af31ff0384d2f739b4b92b0ca0e6",
         intel: "044aaab9021efb3d743ce14dfcfc10ed0fdaaee1a6712938e7cabaa3360e1aac"

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
