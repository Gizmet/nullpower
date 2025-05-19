# Usage Guide: nullpower

> **Note:** Replace `/home/USER` with your actual username in all configuration files and paths.

## What does it do?

- Seamlessly switches between performance and power-saving profiles based on AC/BAT state.
- Sets brightness (AC: 100%, BAT: 30%).
- Starts/stops Docker and Bluetooth services.
- Switches TLP profile.
- Logs all actions to `~/.local/share/nullpower/nullpower.log`.

## How to use

1. Install dependencies: `tlp`, `brightnessctl`, (optional: `docker`, `bluetooth`)
2. Install the script and udev rule (see installation guide).
3. Plug or unplug AC power — the script will auto-run and switch profiles.
4. Check logs at `~/.local/share/nullpower/nullpower.log` for activity.

## Manual Run

You can also run the script manually:

```sh
~/bin/nullpower.sh
```

## Customization

- Edit the script to change brightness levels or add/remove services.
- Works out-of-the-box for ThinkPad P1 Gen3, but easily adaptable. 