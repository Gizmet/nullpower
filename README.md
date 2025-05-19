# nullpower

> **Note:** Wherever you see `/home/USER` in configuration files or documentation, replace `USER` with your actual Linux username. This makes the project portable for any user account.

Seamless, automatic power profile switching for Linux laptops.  
Built and tested on ThinkPad P1 Gen 3 (EndeavourOS), but easily adaptable.

## Features

- 💡 Sets screen brightness (AC: 100%, Battery: 30%)
- 🔌 Starts/stops Docker & Bluetooth (or whatever you need it to on your own machine)
- ⚙️ Switches TLP to correct profile
- 📝 Logs every mode switch for visibility
- 🧘 Fully automatic — just plug in or unplug

## Why?

Tired of manually switching to "power saver"?  
Want your laptop to act like a quiet ultrabook on battery and a beast when plugged in?

This is for you.

## Setup

See [docs/installation.md](docs/installation.md) for full instructions.

## Usage

- The script runs automatically on AC/BAT events (via udev rule)
- Logs are at `~/.local/share/nullpower/nullpower.log`
- Manual run: `~/bin/nullpower.sh`

## Dependencies

- `tlp`
- `brightnessctl`
- Optional: `docker`, `bluetooth`

## Security

- Requires minimal sudoers rule for systemctl (see install guide)

## License

MIT 