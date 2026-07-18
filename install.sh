#!/usr/bin/env bash
# script/public/install.sh — Universal PineSeed installer / uninstaller.
#
# Self-contained: no local dependencies. Safe to curl | bash.
#
# Usage:
#   install.sh <prefix> [--uninstall] [--version <tag>] [--install-dir <path>]
#
#   <prefix>            Tag prefix / release namespace:
#                       agency, acp, edge, hypus, login, desktop
#
# Flags:
#   --uninstall         Uninstall instead of install.
#   --version  <tag>    Full tag (e.g. agency/v0.3.1). Default: latest.
#   --install-dir <p>   Override install/uninstall location.
#   --help | -h         Show this help.
#
# Env vars (flags take precedence):
#   INSTALL_DIR         Override install location.
#
# Platform-correct defaults (no sudo):
#   binaries  macOS/Linux → ~/.local/bin
#             Windows     → ~/AppData/Local/Programs/PineSeed
#   GUI apps  macOS       → ~/Applications
#             Linux       → ~/.local/bin
#             Windows     → ~/AppData/Local/Programs/PineSeed
#
# GUI prefixes: login, desktop
# Binary prefixes: agency, acp, edge, hypus
set -euo pipefail

# ── Constants ─────────────────────────────────────────────────────────────────
RELEASE_REPO="${RELEASE_REPO:-PineSeedAI/app-release}"

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# ── Helpers ───────────────────────────────────────────────────────────────────
_die()    { echo -e "${RED}error: $*${NC}" >&2; exit 1; }
_stream() {
  local url="$1" dest="$2"
  if command -v curl >/dev/null 2>&1; then
    curl --fail --silent --show-error --location --output "$dest" "$url"
  elif command -v wget >/dev/null 2>&1; then
    wget --quiet --output-document="$dest" "$url"
  else
    _die "neither curl nor wget found"
  fi
}
_latest() {
  local prefix="$1" out
  local api="https://api.github.com/repos/${RELEASE_REPO}/releases"
  local tmp
  tmp="$(mktemp)"
  trap '[ -n "${tmp:-}" ] && rm -f "$tmp"' RETURN
  _stream "$api" "$tmp"
  out="$(grep '"tag_name"' "$tmp" \
    | grep "\"${prefix}-v" \
    | head -1 \
    | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/')"
  [ -n "$out" ] || _die "no release found for prefix '${prefix}' in ${RELEASE_REPO}"
  printf '%s' "$out"
}

# ── Usage ─────────────────────────────────────────────────────────────────────
_usage() { grep '^#' "$0" | sed 's/^# \{0,1\}//'; exit 0; }

# ── Args ──────────────────────────────────────────────────────────────────────
PREFIX=""
UNINSTALL=0
FLAG_VERSION=""
FLAG_INSTALL_DIR=""

while [ $# -gt 0 ]; do
  case "$1" in
    --uninstall)   UNINSTALL=1; shift ;;
    --version)     [ $# -ge 2 ] || _die "--version requires a value"
                   FLAG_VERSION="$2"; shift 2 ;;
    --install-dir) [ $# -ge 2 ] || _die "--install-dir requires a value"
                   FLAG_INSTALL_DIR="$2"; shift 2 ;;
    --help|-h)     _usage ;;
    --*)           _die "unknown flag: $1" ;;
    *)             [ -z "$PREFIX" ] || _die "unexpected argument: $1"
                   PREFIX="$1"; shift ;;
  esac
done

[ -n "$PREFIX" ] || { echo -e "${RED}error: <prefix> is required${NC}" >&2; _usage; }

# ── Platform ──────────────────────────────────────────────────────────────────
raw_os="$(uname -s)"

_default_bin_dir() {
  case "$raw_os" in
    Darwin|Linux)         echo "${HOME}/.local/bin" ;;
    MINGW*|MSYS*|CYGWIN*) echo "${HOME}/AppData/Local/Programs/PineSeed" ;;
    *) _die "unsupported OS: ${raw_os}" ;;
  esac
}
_default_gui_dir() {
  case "$raw_os" in
    Darwin)               echo "${HOME}/Applications" ;;
    Linux)                echo "${HOME}/.local/bin" ;;
    MINGW*|MSYS*|CYGWIN*) echo "${HOME}/AppData/Local/Programs/PineSeed" ;;
    *) _die "unsupported OS: ${raw_os}" ;;
  esac
}
_is_gui() { case "$PREFIX" in desktop) return 0;; *) return 1;; esac; }

# ── Resolve install dir ───────────────────────────────────────────────────────
INSTALL_DIR="${FLAG_INSTALL_DIR:-${INSTALL_DIR:-}}"
if [ -z "$INSTALL_DIR" ]; then
  if _is_gui; then INSTALL_DIR="$(_default_gui_dir)"
  else             INSTALL_DIR="$(_default_bin_dir)"
  fi
fi

# ── Resolve tag ───────────────────────────────────────────────────────────────
RELEASE_TAG="${FLAG_VERSION:-}"
if [ -z "$RELEASE_TAG" ]; then
  echo -e "${BLUE}Resolving latest ${PREFIX} release...${NC}"
  RELEASE_TAG="$(_latest "$PREFIX")"
  echo -e "${GREEN}latest: ${RELEASE_TAG}${NC}"
fi

# ── Derive script name ────────────────────────────────────────────────────────
ACTION="$([ "$UNINSTALL" -eq 1 ] && echo "uninstall" || echo "install")"
case "$PREFIX" in
  agency)  SCRIPT_NAME="harness-${ACTION}.sh" ;;
  acp)     SCRIPT_NAME="acp-agent-${ACTION}.sh" ;;
  edge)    SCRIPT_NAME="edge-server-${ACTION}.sh" ;;
  hypus)   SCRIPT_NAME="hypus-mantle-${ACTION}.sh" ;;
  login)   SCRIPT_NAME="login-${ACTION}.sh" ;;
  desktop) SCRIPT_NAME="desktop-${ACTION}.sh" ;;
  *)       _die "unknown prefix: ${PREFIX}" ;;
esac

SCRIPT_URL="https://github.com/${RELEASE_REPO}/releases/download/${RELEASE_TAG}/${SCRIPT_NAME}"

# ── Fetch and execute ─────────────────────────────────────────────────────────
echo -e "${BLUE}Fetching ${SCRIPT_NAME} @ ${RELEASE_TAG}...${NC}"
tmp_script="$(mktemp)"
trap '[ -n "${tmp_script:-}" ] && rm -f "$tmp_script"' EXIT
_stream "$SCRIPT_URL" "$tmp_script"
[ -s "$tmp_script" ] || _die "empty response fetching ${SCRIPT_URL}"

export INSTALL_DIR
export PINESEED_BIN_DIR="$INSTALL_DIR"

exec bash "$tmp_script"
