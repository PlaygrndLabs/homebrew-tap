cask "gh-ui" do
  arch arm: "arm64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "5ee75102fe0216f5696f1bceaa3c40b0ab6f38b69c641353e212096e584f5def",
         intel: "4c2755a65859d0bac1f116b6e23d1d8bcf8a0516bcf4fb2b43ab0f66a414e060"

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
