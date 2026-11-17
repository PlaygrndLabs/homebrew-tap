cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.19.0"
  sha256 arm:   "8fc35b29ff37b0645519ad9091ca304159d6b4cabd7c597529e67252c2ed0252",
         intel: "c9924f30780f80e88073150911f01223c56da92a0e2b7204773dae2b692fdc74"

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
