cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.18.0"
  sha256 arm:   "dc874d47874d4a7524be6d7e7fe6c653793999fd6ebb82666889b95c607e304d",
         intel: "aa4001cd93a9781557a1cd6927afe535163514d464911e1bd771c2a98b52bb82"

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
