cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.20.0"
  sha256 arm:   "17fe0e4e70d85a3e032b50ba2f20a3d6184418255652e57994f209c0bbbbcef9",
         intel: "41e130e8ffc219d57c57667b85096364ecb30958f2b1fc12ce69c7485d7f5041"

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
