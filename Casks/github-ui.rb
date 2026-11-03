cask "github-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "08210b3f5442269d2ea72ecc8dfe408a2c018363fa1de07ce88eec9f2d446bab",
         intel: "b6ba6e0ed6a74d66514ef3bef4e7ec7a59dfa131fcd157a0a6a1418b1d87ac79"

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
