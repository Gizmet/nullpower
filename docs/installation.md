# Installation Guide: nullpower

> **Note:** Replace `USER` with your actual Linux username wherever it appears in the following instructions, udev rules, or service files.

For advanced tweaks, see [docs/tweaks.md](tweaks.md). For troubleshooting, see [docs/troubleshooting.md](troubleshooting.md).

## 1. Install dependencies

```sh
sudo pacman -S tlp brightnessctl
# Optional:
sudo pacman -S docker bluez
```

## 2. Clone the repo

```sh
git clone https://github.com/gizmetproton/nullpower.git
cd nullpower
```

## 3. Install the script

```sh
mkdir -p ~/bin
cp bin/nullpower.sh ~/bin/
chmod +x ~/bin/nullpower.sh
```

## 4. Install the udev rule

```sh
sudo cp udev/99-nullpower.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
```

## 5. Grant systemctl sudo access

```sh
sudo visudo
```

Add this line (replace `USER` with your username if needed):

```
USER ALL=NOPASSWD: /bin/systemctl start docker, /bin/systemctl stop docker, /bin/systemctl start bluetooth, /bin/systemctl stop bluetooth
```

## 6. Test it

```sh
~/bin/nullpower.sh
```

Unplug AC and run again to test battery profile.

## 7. (Optional) Enable systemd service

```sh
sudo cp systemd/nullpower.service /etc/systemd/system/
sudo systemctl enable --now nullpower.service
``` 