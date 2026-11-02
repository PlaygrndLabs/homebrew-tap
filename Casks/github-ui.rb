cask "github-ui" do
  version :latest
  sha256 :no_check

  arch arm: "arm64", intel: "x64"

  url "https://github.com/PlaygrndLabs/gh-ui/releases/latest/download/GitHub-UI-#{arch}.dmg"
  name "GitHub UI"
  desc "GitHub client with a built-in code review agent"
  homepage "https://github.com/PlaygrndLabs/gh-ui"

  app "gh-ui.app"

  # GitHub UI is distributed outside Apple's notarization service.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/gh-ui.app"]
  end
end
