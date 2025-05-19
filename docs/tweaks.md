# Tweaks & Advanced Tips

## Battery Life Hacks

- Lower brightness further for ultra-long battery life: edit `nullpower.sh` and set battery brightness to 10-20%.
- Disable unused hardware (Wi-Fi, Bluetooth, camera) when on battery for extra savings.
- Use TLP's advanced config for more aggressive power saving (see `man tlp`).

## Optional Performance Profiles

- Add custom scripts to start/stop other services (e.g., VMs, cloud sync) in `nullpower.sh`.
- Tune TLP profiles for your workload: edit `/etc/tlp.conf`.
- For NVIDIA laptops: use `nvidia-smi` to set power limits or switch GPU modes.

## Customization

- The script is modular—add/remove actions as needed for your hardware. 