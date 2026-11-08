cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.10.0"
  sha256 arm:   "8f280acb16b089128991de2e6c2696f4a5df7fead9f183a11e126616a4ab8480",
         intel: "eb2c4376cd4677ecdb061fe27c3406bceca919b86be68a7802aa3271bef5dc5a"

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
