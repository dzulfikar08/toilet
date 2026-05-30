#!/bin/bash
#
# toilet — install script
# Usage: curl -sL https://raw.githubusercontent.com/USER/toilet/main/install.sh | bash
#

set -euo pipefail

BOLD='\033[1m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
CYAN='\033[36m'
DIM='\033[2m'
RESET='\033[0m'

REPO="dzulfikar08/toilet"
DEST="/usr/local/bin/toilet"

printf "${BOLD}${CYAN}🚽 Installing toilet...${RESET}\n\n"

# Check macOS
if [[ "$(uname)" != "Darwin" ]]; then
    printf "${RED}✗ toilet only works on macOS${RESET}\n"
    exit 1
fi

# Download
printf "${DIM}Downloading...${RESET}\n"
if ! curl -sL "https://raw.githubusercontent.com/${REPO}/main/toilet" -o /tmp/toilet-install; then
    printf "${RED}✗ Download failed${RESET}\n"
    exit 1
fi

# Install
if [[ -w /usr/local/bin ]]; then
    cp /tmp/toilet-install "$DEST"
else
    printf "${DIM}Need sudo to install to ${DEST}${RESET}\n"
    sudo cp /tmp/toilet-install "$DEST"
fi

chmod 755 "$DEST"
rm -f /tmp/toilet-install

# Verify
printf "${GREEN}✓ Installed to ${DEST}${RESET}\n"

# Check dependencies
if ! command -v imagesnap &>/dev/null; then
    printf "${YELLOW}⚠ imagesnap not found (needed for camera capture)${RESET}\n"
    printf "${DIM}  Install with: brew install imagesnap${RESET}\n\n"
fi

printf "${BOLD}${GREEN}🚽 toilet is ready!${RESET}\n\n"
printf "Next steps:\n"
printf "  ${CYAN}toilet setup${RESET}    — Configure Telegram alerts\n"
printf "  ${CYAN}toilet status${RESET}   — Check everything is working\n"
printf "  ${CYAN}sudo toilet${RESET}     — Start monitoring\n"
