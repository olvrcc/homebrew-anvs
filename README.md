# Homebrew ANVS

Homebrew tap for [anvs](https://github.com/olvrcc/anvs) - Automatic Node Version Switcher.

## Installation

Install the latest version:
```bash
brew install olvrcc/anvs/anvs
```

Or add the tap first:
```bash
brew tap olvrcc/anvs
brew install anvs
```

## Usage

After installation, run:
```bash
anvs setup
```

This will configure shell integration for automatic Node.js version switching.

## Links

- Main repository: https://github.com/olvrcc/anvs
- npm package: https://www.npmjs.com/package/anvs
- Documentation: https://github.com/olvrcc/anvs#readme

## Migrating from XVN

If you previously installed `xvn` via Homebrew:

```bash
brew uninstall xvn
brew untap olvrcc/xvn  # Optional
brew install olvrcc/anvs/anvs
anvs setup
```

See the [migration guide](https://github.com/olvrcc/anvs/blob/main/docs/XVN_TO_ANVS_MIGRATION.md) for details.
