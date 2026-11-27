cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.26.0"
  sha256 arm:   "7631d1a90b77743f516668d54449ef76eadf34e0cdbf7e6c549cb3e57a32a866",
         intel: "8f6068364f30821132c3bd9c3293af892f44489f5511e6bb5bfc23501d8158f1"

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
