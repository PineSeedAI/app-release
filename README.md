# PineSeed app releases

### acp-agent  (tag pattern: acp/vX.Y.Z)
`curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/acp/v0.1.0/acp-agent-install.sh | PINESEED_BIN_DIR=/usr/local/bin bash`
```json
{
  "agent_servers": {
    "PineSeed": {
      "type": "custom",
      "command": "pineseed-acp-agent",
      "args": ["--account", "billy"],
      "env": {
        "PINESEED_API_URL": "https://...",
        "PINESEED_AUTHN_SERVER_URL": "https://...",
        "PINESEED_APP_URL": "https://...",
        "PINESEED_ACP_LOAD_SESSION_TIMEOUT_MS": "30000",
        "PINESEED_ACP_UPLOAD_TTL_S": "60",
      },
    },
  },
}
```
<!--
### harness  (tag pattern: agency/vX.Y.Z)
```sh
curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/agency/v0.1.0/harness-install.sh | PINESEED_BIN_DIR=/usr/local/bin bash
```

### edge-server  (tag pattern: edge/vX.Y.Z)
```sh
curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/edge/v0.1.0/edge-server-install.sh | PINESEED_BIN_DIR=/usr/local/bin bash
```

### desktop app  (tag pattern: desktop/vX.Y.Z)
#### macOS / Linux — downloads platform installer, verifies sha512, installs
```sh
curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/desktop/v0.1.0/desktop-install.sh | bash
```-->
