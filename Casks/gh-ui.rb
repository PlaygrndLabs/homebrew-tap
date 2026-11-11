cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.16.1"
  sha256 arm:   "5d07e0bb5e6f24d4f426fb0cd9bbebc40d7fe461a800098734f01993e1957f25",
         intel: "82972a607ca9aadf5232139918de84742094d5e9a46f7827b642a896fd284858"

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
