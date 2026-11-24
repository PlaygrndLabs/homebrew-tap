cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.22.0"
  sha256 arm:   "1abb3daee27944f6b0f49d9503b23301cb97dde8d201938e64f569e2f3fd16b6",
         intel: "6e7939d99ef5e83edfab1d28c14c61cd7fb29cc35ffbe19030dc73bb17bf474e"

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
