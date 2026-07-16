# PineSeed app releases

## Installation

### Apps: `agency`, `acp`, `edge`, `hypus`, `login`, `desktop`

#### Base usage:

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
