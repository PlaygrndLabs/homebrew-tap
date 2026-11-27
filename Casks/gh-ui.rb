cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.23.0"
  sha256 arm:   "90e9a837c5c42cda193bdfa276a8663fd6fcce29d4e4af1b079fa6d598a8ad76",
         intel: "d3964df5c05e13645a1cc35c7208ea23f921285e702b68db5e02caf3ad118d00"

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
