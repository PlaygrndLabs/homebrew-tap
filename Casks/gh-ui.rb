cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.13.0"
  sha256 arm:   "b165962df0788f14280837f68f40682612654c05241ddd19c59a412914edafa6",
         intel: "11f60632e8a7bcb9a52bce94be59f86b8d8a59154dee083372becbef8f5e172d"

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
