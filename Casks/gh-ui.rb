cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.19.1"
  sha256 arm:   "e709c3035505dd9be2e1f8a979fd5b089a317d507429fc68c2b0f0deb4649926",
         intel: "aa50644bb883ac893a05940fd51c616e2ab45adcc58743fba12bc152b217e07d"

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
