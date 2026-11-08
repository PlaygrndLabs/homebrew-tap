cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.9.0"
  sha256 arm:   "33e719305d913429b27ec6abcbc97771ada5c89c475a70e22856aff94201c748",
         intel: "9f3499702ec90a3b8ff9fdf2e326d4287c2739d9cc9539b07fa9647e8b7a40e0"

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
