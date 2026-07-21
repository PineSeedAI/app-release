<div align="center">
    <h1>PineSeed public app releases<h1>
    <img src="https://avatars.githubusercontent.com/u/135665908" width="50px" />
</div>


> [!WARNING]
> **Pre-Alpha Developer Preview** — This software is under active development and may be unstable, incomplete, or subject to breaking changes at any time. It is not intended for production use.

## Apps:

### Name: `acp`
The PineSeed ACP agent

On first usage, run this to print the json config for ACP clients:
```sh
pineseed-acp-agent login -i                    → login flow, browser OAuth
pineseed-acp-agent --config                    → prints ACP client config JSON
pineseed-acp-agent --account alice             → ACP agent invocation
```

## Install by app name:

Install latest:
```sh
curl -fsSL https://raw.githubusercontent.com/PineSeedAI/app-release/refs/heads/main/install.sh | bash -s -- <app name>
```

To install a specific version to a custom dir, add:
```sh
 --version <app name>/vX.Y.Z --install-dir /usr/local/bin
```

To uninstall, add:
```sh
 --uninstall
```
