<div align="center">
    <img src="https://avatars.githubusercontent.com/u/135665908" width="50px" />
    <h1>Pine Seed app releases</h1>
</div>


> [!WARNING]
> **Pre-Alpha Developer Preview** — This software is under active development and may be unstable, incomplete, or subject to breaking changes at any time. It is not intended for production use.

## Apps:

### Name: `acp`
The PineSeed ACP agent

```sh
pineseed-acp-agent login -i --workspace-id <id>   → login flow, browser OAuth
pineseed-acp-agent --config                       → prints ACP client config JSON
pineseed-acp-agent --account <email>              → ACP agent invocation
```
<!-- e.g. w.s. i.d. 01940000-0001-7011-8000-000000000001 -->

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
