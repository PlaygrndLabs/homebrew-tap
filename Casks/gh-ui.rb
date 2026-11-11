cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.16.0"
  sha256 arm:   "e7e23c8e6fe86e0abea5e3465b51461b53bf3cbdb929e692f12480b42419b4a2",
         intel: "8803e22e10220a5f0e63cb95d752d789defe9fc88a62e7fca2d16b64c15156ef"

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
