# IQUNIX keyboard (and other Apple spoofing) on Linux

## Make F-keys work as expected:

Fix temporarily:

```bash
echo 2 > /sys/module/hid_apple/parameters/fnmode
```

Fix permanently:

```bash
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
```
