# Screenshare

## Slack Flatpak screen sharing on Fedora 43 / Wayland

### 1. Install required packages

```bash
sudo dnf install xdg-desktop-portal xdg-desktop-portal-gnome pipewire pipewire-utils
```

### 2. Ensure PipeWire is running

```bash
systemctl --user enable --now pipewire pipewire-pulse
```

### 3. Flatpak permissions

```bash
flatpak override --user --socket=wayland com.slack.Slack
flatpak override --user --talk-name=org.freedesktop.portal.Desktop com.slack.Slack
flatpak override --user --talk-name=org.freedesktop.portal.ScreenCast com.slack.Slack
flatpak override --user --talk-name=org.freedesktop.portal.RemoteDesktop com.slack.Slack
flatpak override --user --device=dri com.slack.Slack
flatpak override --user --env=ELECTRON_OZONE_PLATFORM_HINT=wayland com.slack.Slack
```

### 4. Portal config

 Create ~/.config/xdg-desktop-portal/portals.conf:

```ini
[preferred]
default=gnome;gtk
```

### 5. Override the desktop entry

```bash
cp /var/lib/flatpak/exports/share/applications/com.slack.Slack.desktop ~/.local/share/applications/
```

 Edit ~/.local/share/applications/com.slack.Slack.desktop, find the Exec= line and add the flags:

```
Exec=/usr/bin/flatpak run com.slack.Slack --enable-features=WebRTCPipeWireCapturer %U
```

### 6. Log out and back in

 Required for the portal daemon and Wayland socket changes to take effect.

 ────────────────────────────────────────────────────────────────────────────────

 Root cause in one line: Slack Flatpak defaults to XWayland, which can't capture the screen on Wayland by design. The fix forces native
 Wayland mode and grants the sandbox access to the screen capture portal.
