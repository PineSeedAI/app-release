# PineSeed app releases

# harness  (tag pattern: agency/vX.Y.Z)
curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/agency/v0.1.0/harness-install.sh \
  | PINESEED_BIN_DIR=/usr/local/bin RELEASE_TAG=agency/v0.1.0 RELEASE_REPO=PineSeedAI/app-release bash

# acp-agent  (tag pattern: acp/vX.Y.Z)
curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/acp/v0.1.0/acp-agent-install.sh \
  | PINESEED_BIN_DIR=/usr/local/bin RELEASE_TAG=acp/v0.1.0 RELEASE_REPO=PineSeedAI/app-release bash

# edge-server  (tag pattern: edge/vX.Y.Z)
curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/edge/v0.1.0/edge-server-install.sh \
  | PINESEED_BIN_DIR=/usr/local/bin RELEASE_TAG=edge/v0.1.0 RELEASE_REPO=PineSeedAI/app-release bash

# Ghost Overlay desktop app  (tag pattern: desktop/vX.Y.Z)
# macOS / Linux — downloads platform installer, verifies sha512, installs
curl -fsSL https://github.com/PineSeedAI/app-release/releases/download/desktop/v0.1.0/desktop-install.sh \
  | RELEASE_REPO=PineSeedAI/app-release RELEASE_TAG=desktop/v0.1.0 \
    PRODUCT_NAME="Ghost Overlay" APP_VERSION=0.1.0 bash
