# prietus/homebrew-tap

Homebrew tap for [BorgMac](https://github.com/prietus/borg), a native macOS client for [Borg](https://www.borgbackup.org/) backup repositories (BorgBase, BorgBox, SSH and local).

## Install

```sh
brew install --cask prietus/tap/borgmac
```

That puts `BorgMac.app` in `/Applications`. The build is signed with a Developer ID and notarized by Apple, so it opens without Gatekeeper prompts.

BorgMac drives the `borg` command line tool, which you install separately. The cask does not declare it as a dependency because the two formulae that provide it conflict with each other, so pick one:

```sh
brew install borgbackup         # standard
brew install borgbackup-fuse    # same, plus FUSE support for mounting archives
```

## Upgrade

```sh
brew upgrade --cask borgmac
```

## Uninstall

```sh
brew uninstall --cask borgmac          # app only
brew uninstall --cask --zap borgmac    # app + local data, caches, logs and scheduled-backup agents
```

Scheduled backups are launchd agents that point at `/Applications/BorgMac.app`. Turn schedules off inside the app before a plain uninstall, or use `--zap`.

## Requirements

macOS 14 (Sonoma) or newer.
