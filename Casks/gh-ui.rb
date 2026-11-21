cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.21.0"
  sha256 arm:   "9583c08b5878f9235e6c1c5dcf1655120326d6a0428aafb8b76c7bd44763f3e7",
         intel: "a41440c6bf2988680f95d7f8b6fcaa4f552368fde87e149f35e1cda1b297f288"

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
