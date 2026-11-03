cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "1aa21f2203db7c09d0a4570e663d4d15c9eb6d41dd6655fda295bf817a0ce055",
         intel: "16a005738daaa64eb102fa052216b70f2ebc9e2a7f4a2b92b15e41816436bb3b"

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
