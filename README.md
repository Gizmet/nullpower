# nullpower

![Platform](https://img.shields.io/badge/platform-Linux-informational)
![License](https://img.shields.io/github/license/Gizmet/nullpower)
![ThinkPad P1 Gen3](https://img.shields.io/badge/ThinkPad%20P1%20Gen3-Optimized-brightgreen)

> **Note:** Wherever you see `/home/USER` in configuration files or documentation, replace `USER` with your actual Linux username. This makes the project portable for any user account.

Seamless, automatic power profile switching for Linux laptops.  
Built and tested on ThinkPad P1 Gen 3 (EndeavourOS), but easily adaptable.

## Supported Hardware

- ✔️ **Tested on:** ThinkPad P1 Gen 3
- 💡 **Should work on:** Any Intel+NVIDIA hybrid laptop, any system using TLP + brightnessctl, Arch-based distros (EndeavourOS, Manjaro, etc.)

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

---

**GitHub Topics:**
`linux` `thinkpad` `power-management` `tlp` `hybrid-graphics` `nvidia` `laptop` `battery` 