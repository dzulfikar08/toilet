# 🚽 toilet

**Anti-theft alarm for macOS.** Plug in your Mac, run `toilet`, go pee in peace.

When someone unplugs your charger, it:

- 🔊 **Blasts an alarm** — max volume siren + voice warning, loops until your password stops it
- 📸 **Snaps the thief** — webcam photo captured instantly (camera stays warm)
- 📨 **Sends to Telegram** — photo + timestamp delivered to your phone
- 🔒 **Anti-tamper** — runs as root, traps kill signals, requires your login password to stop

## Quick Start

```bash
# Install
curl -sL https://raw.githubusercontent.com/USER/toilet/main/install.sh | bash

# Install camera tool
brew install imagesnap

# Configure Telegram alerts
toilet setup

# Test everything
toilet test

# Arm it (plug in charger first!)
sudo toilet
```

## How It Works

```
$ sudo toilet

🚽 toilet v1.0.0 — Anti-theft monitor

📷 Camera warmed up (running in background)
Charging detected. Monitoring...
Unplug → alarm. Ctrl+C or 'q' → stop (password required).

        ⚡ CHARGER UNPLUGGED! ALARM TRIGGERED!
        📸 Photo captured
        📨 Telegram alert sent
        🔊 ALARM ON — Press Ctrl+C or 'q' + password to stop
```

## Commands

| Command | Description |
|---------|-------------|
| `sudo toilet` | Start monitoring (must be charging) |
| `toilet setup` | Configure Telegram bot token & chat ID |
| `toilet test` | Test alarm, camera & Telegram |
| `toilet status` | Show charging status & config |

## Stopping the Alarm

- **During monitoring**: `Ctrl+C` stops cleanly
- **After alarm triggers**: `Ctrl+C` or press `q`, then enter your **login password** to stop

A thief can't stop it without your password.

## Requirements

- macOS (uses `pmset`, `say`, `afplay`, `osascript`)
- [imagesnap](https://github.com/rharder/imagesnap) for webcam capture (`brew install imagesnap`)
- Telegram bot for alerts (free — use [@BotFather](https://t.me/BotFather))

## Get the Binary

Don't want the manual steps? [Buy the pre-built binary for $1 →](https://GUMROAD_LINK)

## License

MIT — do whatever you want with it.
