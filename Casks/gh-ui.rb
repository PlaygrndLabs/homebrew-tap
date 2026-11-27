cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.24.0"
  sha256 arm:   "05d63114cdc0f4a2e2ad7fdb41e07474e1d62198ee78c908c3e5e5fd16cecdeb",
         intel: "938babcd28f7b6364c5619eb39d044f69ba0ada820696ce32cf0ed679b6ddbbf"

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
