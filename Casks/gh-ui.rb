cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.15.0"
  sha256 arm:   "da4ea620f4275f57708f5f4ab32845aa09110f8973ef112e05d628fcdf34e3f8",
         intel: "61bb10f2010984251d4fbabbd073dfd5361a4c9bebdbffae1cc83d074d19a75e"

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
