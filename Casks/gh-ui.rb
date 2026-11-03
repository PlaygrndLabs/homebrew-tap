cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "1eacc9c23492121444776c0975ab1010a5bb862985174e3ee3f1d9486fc7752c",
         intel: "b0afb8adf985809637b8efe674c2331b75ec2b95277c4f6e80e7b19dd568e430"

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
