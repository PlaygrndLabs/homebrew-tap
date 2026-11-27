cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.25.0"
  sha256 arm:   "ef1c42e84fdd5b7a3f85e1003333030b3c6e9b4dae808a51ac08f69e595a6bc7",
         intel: "a2dcb2e5dee0784ea30ad94eed47b847db776f22ac858504b0365a37ffc8393d"

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
