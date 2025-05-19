# nullpowerd: Dynamic CPU Governor Daemon

## Features
- Monitors average CPU usage every 3 seconds (configurable)
- If idle (<25% for 30s): forces powersave governor
- If heavy (>80% for 5s): forces performance governor
- Resets to TLP/default if nothing changes for a while
- Does not conflict with AC/BAT switching
- Optional, configurable, lightweight
- Logs to `~/.local/share/nullpower/nullpowerd.log`

## Real-World Usage & Stats
- **Log growth:** At 3s intervals, about 28,800 log lines/day (~2–3MB/day, auto-rotated if you set up logrotate)
- **Performance switch:** Confirmed to trigger when CPU usage exceeds the `load_threshold` for 5s (e.g., 100% during `stress` test)
- **Powersave switch:** Triggers when CPU usage stays below `idle_threshold` for 30s
- **GPU workloads:** If your heavy work is offloaded to GPU (e.g., Ollama with NVIDIA), CPU governor may not switch to performance

## Recommended Thresholds
- `load_threshold = 80` (default): Only triggers for very heavy, all-core CPU loads (compiling, LLMs, stress tests)
- `load_threshold = 60`: More responsive, triggers for heavy multitasking or moderate LLM use
- `load_threshold = 50`: Triggers for moderate loads, more responsive but less battery savings

Tune `idle_threshold` and `check_interval` as needed for your workflow.

## Configuration
Edit (or create): `~/.config/nullpower/config.ini`

```ini
[nullpower]
enable_dynamic_governor = true
idle_threshold = 25
load_threshold = 60  # Example: more responsive
check_interval = 3
```

## Autorun Setup (Systemd)
To run nullpowerd automatically on boot:

1. Ensure `systemd/nullpowerd.service` points to your script path (e.g., `/home/gizmet/bin/nullpowerd.sh`)
2. Install the service:
   ```sh
   sudo cp systemd/nullpowerd.service /etc/systemd/system/
   sudo systemctl daemon-reload
   sudo systemctl enable --now nullpowerd.service
   ```

## Usage
- Start manually:
  ```sh
  ~/bin/nullpowerd.sh
  ```
- Force performance or powersave:
  ```sh
  ~/bin/nullpowerd.sh force-performance
  ~/bin/nullpowerd.sh force-powersave
  ```

## Log Rotation
To keep only the last 24 hours of logs, set up logrotate:

```
/home/gizmet/.local/share/nullpower/nullpowerd.log {
    daily
    rotate 1
    compress
    missingok
    notifempty
    copytruncate
}
```

## Notes
- On AC power, nullpowerd exits and lets TLP handle the governor.
- On battery, dynamic rules are active.
- All actions are logged for transparency. 