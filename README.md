# Homebrew tap for Trawlr

[Trawlr](https://github.com/SamuelCGilbert/trawlr) is instant file name search with an
always-current index, for macOS, Linux and Windows.

```sh
brew install --cask samuelcgilbert/trawlr/trawlr
```

This installs the app, starts the indexing daemon and puts the `trawlr` command on PATH. Then
give the daemon Full Disk Access so it can list Desktop, Documents and Downloads; the install
prints how. `brew upgrade` keeps it current, and `brew uninstall --cask --zap trawlr` removes it
with its index and settings.

The cask is generated from
[`dist/homebrew/trawlr.rb`](https://github.com/SamuelCGilbert/trawlr/blob/main/dist/homebrew/trawlr.rb)
in the main repository; report problems there.
