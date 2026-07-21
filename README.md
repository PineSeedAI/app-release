# PineSeed public app release repo

<center><img src="https://avatars.githubusercontent.com/u/135665908" width="50px" height="50px" /></center>


> [!WARNING]
> **Pre-Alpha Developer Preview** — This software is under active development and may be unstable, incomplete, or subject to breaking changes at any time. It is not intended for production use.

## Apps:

### Name: `acp`
The PineSeed ACP agent

On first usage, run this to print the json config for ACP clients:
```sh
pineseed-acp-agent --config
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
