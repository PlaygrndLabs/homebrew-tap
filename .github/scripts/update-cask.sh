#!/usr/bin/env bash
# Pins Casks/github-ui.rb to gh-ui's latest release and its installers' checksums. Never moves to an older version.
set -euo pipefail

cask=Casks/github-ui.rb
release=$(gh api repos/PlaygrndLabs/gh-ui/releases/latest)
version=$(jq -r '.tag_name | ltrimstr("v")' <<<"$release")
digest() { jq -r --arg name "$1" '.assets[] | select(.name == $name) | .digest | ltrimstr("sha256:")' <<<"$release"; }
arm64=$(digest GitHub-UI-arm64.dmg)
x64=$(digest GitHub-UI-x64.dmg)

[[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "Unexpected version: $version" >&2; exit 1; }
for sha in "$arm64" "$x64"; do
  [[ $sha =~ ^[0-9a-f]{64}$ ]] || { echo "Missing or invalid checksum in release $version" >&2; exit 1; }
done

current=$(sed -nE 's/^  version "(.*)"$/\1/p' "$cask")
if [[ $version == "$current" || $(printf '%s\n%s\n' "$current" "$version" | sort -V | tail -1) != "$version" ]]; then
  echo "Cask is at $current; latest release is $version. Nothing to do."
  exit 0
fi

sed -i.bak -E \
  -e "s/^  version \".*\"$/  version \"$version\"/" \
  -e "s/^(  sha256 arm: +)\"[0-9a-f]{64}\",$/\1\"$arm64\",/" \
  -e "s/^( +intel: +)\"[0-9a-f]{64}\"$/\1\"$x64\"/" \
  "$cask"
rm -f "$cask.bak"
echo "Updated the cask from $current to $version."
