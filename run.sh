#!/usr/bin/env bash

#
# Linux User Fix Script - Main Entry Point
#
# This script is designed for Linux systems only.
# It will detect if running on macOS and exit with an error message.
#

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ────────────────────────────────────────────────────────────────
# Platform Detection
# ────────────────────────────────────────────────────────────────

# Source platform detection module
if [ ! -f "$SCRIPT_DIR/lib/platform.sh" ]; then
    echo "ERROR: Platform detection module not found at $SCRIPT_DIR/lib/platform.sh"
    exit 1
fi

# shellcheck source=lib/platform.sh
source "$SCRIPT_DIR/lib/platform.sh"

# ────────────────────────────────────────────────────────────────
# macOS Check - Exit if running on macOS
# ────────────────────────────────────────────────────────────────

if is_macos; then
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                    ⚠️  PLATFORM ERROR ⚠️                        ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo ""
    echo "❌ This script is designed for Linux systems only."
    echo ""
    echo "   Detected platform: macOS"
    echo ""
    echo "   This repository contains a Linux user fix utility that"
    echo "   diagnoses and fixes user login issues on Linux systems."
    echo ""
    echo "   Please run this script on a Linux system."
    echo ""
    exit 1
fi

# ────────────────────────────────────────────────────────────────
# Linux Check - Verify we're on Linux
# ────────────────────────────────────────────────────────────────

if ! is_linux; then
    echo "ERROR: Unsupported platform detected: $PLATFORM_NAME"
    echo "This script only supports Linux systems."
    exit 1
fi

# ────────────────────────────────────────────────────────────────
# Welcome Banner
# ────────────────────────────────────────────────────────────────

clear
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║         🛠️  Linux User Fix Tool 🛠️                            ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
print_platform_info
echo ""

# ────────────────────────────────────────────────────────────────
# Execute Fix User Script
# ────────────────────────────────────────────────────────────────

FIX_SCRIPT="$SCRIPT_DIR/scripts/fix_user.sh"

    # Validate script exists
if [ ! -f "$FIX_SCRIPT" ]; then
    echo "❌ Error: Fix user script not found at: $FIX_SCRIPT"
    exit 1
    fi

    # Make script executable
chmod +x "$FIX_SCRIPT" 2>/dev/null || true

    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🛠️  Fix Linux User Login Issues"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "This tool helps diagnose and fix user login problems on Linux."
    echo ""
    echo "Common issues this fixes:"
    echo "  • User cannot log in (wrong shell, missing home directory, etc.)"
    echo "  • Permission problems with user directories"
    echo "  • Corrupted user configuration"
    echo ""
    echo "⚠️  WARNING:"
    echo "   - This script requires sudo/root privileges"
    echo "   - It will modify system user configurations"
    echo "   - Make sure you understand what you're doing"
    echo ""

# Check if running with sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges."
    echo "Please run with sudo:"
    echo ""
    echo "  sudo bash $0"
    echo ""
    exit 1
fi

echo "🚀 Starting user fix tool..."
    echo ""

# Execute fix script
if bash "$FIX_SCRIPT" "$@"; then
    echo ""
    echo "✅ User fix completed successfully!"
    exit 0
else
    echo ""
    echo "❌ User fix failed. Check the output above for details."
    exit 1
fi
