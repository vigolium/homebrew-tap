# Homebrew Tap for Vigolium

This is the [Homebrew](https://brew.sh/) tap for [Vigolium](https://vigolium.com) — a high-fidelity vulnerability scanner fusing agentic AI with native speed, modularity, and precision.

The formula installs the native `vigolium` binary directly from the official
[`@vigolium/vigolium`](https://www.npmjs.com/package/@vigolium/vigolium) npm
release, so no Node.js runtime is required.

## Installation

```bash
brew install vigolium/tap/vigolium
```

## Upgrade

```bash
brew update
brew upgrade vigolium
```

## Uninstall

```bash
brew uninstall vigolium/tap/vigolium
```

## Usage

```bash
vigolium --help
```

## How updates work

A scheduled [GitHub Actions workflow](.github/workflows/update-formula.yml) runs
every 2 days, reads the latest version from the npm registry, recomputes the
`sha256` for each platform tarball (`darwin-arm64`, `darwin-x64`, `linux-arm64`,
`linux-x64`), and commits the refreshed formula. You can also trigger it manually
from the **Actions** tab.

## Links

- [Vigolium website](https://vigolium.com)
- [npm package](https://www.npmjs.com/package/@vigolium/vigolium)
- [Source repository](https://github.com/vigolium/vigolium)
