<center>
    <img src="https://avatars.githubusercontent.com/u/135665908?v=4" width="50px" height="50px" />
    <h1>&nbsp; </h1>
    <h1>PineSeed public app releases</h1>
</center>


> [!WARNING]
> **Pre-Alpha Developer Preview** — This software is under active development and may be unstable, incomplete, or subject to breaking changes at any time. It is not intended for production use.

## Apps:

### Name: `acp`
The PineSeed ACP agent

On first usage, run this to print the json config for ACP clients:
```sh
pineseed-acp-agent --config
```

### Name: `login`
The PineSeed login app

Once installed, open `pineseed-login` as a desktop app.

<!--### Apps: `agency`, `acp`, `edge`, `hypus`, `login`, `desktop`-->

## Installation by <app name>:

Install latest:
```sh
curl -fsSL https://raw.githubusercontent.com/PineSeedAI/app-release/refs/heads/main/install.sh | bash -s -- <app>
```

To install a specific version to a custom dir, add:
```sh
 --version <app>/vX.Y.Z --install-dir /usr/local/bin
```

To uninstall, add:
```sh
 --uninstall
```
