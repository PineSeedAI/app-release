# PineSeed app releases

### acp-agent  (tag pattern: acp/vX.Y.Z)
`curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/acp/vX.Y.Z/acp-agent-install.sh | PINESEED_BIN_DIR=/usr/local/bin bash`
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
