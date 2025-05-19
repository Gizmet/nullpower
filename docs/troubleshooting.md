# Troubleshooting

## Brightness Not Changing
- Ensure `brightnessctl` is installed and your user is in the `video` group.
- Some laptops require root for brightness changes—try running the script with `sudo`.
- Check if `/sys/class/backlight` exists and is writable.

## TLP Not Switching Profiles
- Make sure `tlp` is installed and enabled (`sudo systemctl status tlp`).
- Check for errors in the log at `~/.local/share/nullpower/nullpower.log`.

## Docker/Bluetooth Not Starting/Stopping
- Confirm you have the correct sudoers rule (see installation guide).
- Check service status: `systemctl status docker` or `systemctl status bluetooth`.

## General Debugging
- Run the script manually and watch for error output.
- Check the log file for details. 