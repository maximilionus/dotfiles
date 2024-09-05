# Script will create 2 services to ensure that gnome-shell is suspended
# **before** the NVIDIA driver, so it will not make any resume calls preventing
# the correct system suspend procedure.
#
# For the 555 NVIDIA proprietary driver.
#
# Note: 560 does not require this fix anymore, looks like it's fixed for now.

set -e

SYSTEMD_DIR="/etc/systemd/system"

cat <<EOF > "$SYSTEMD_DIR/nvidia-gnome-suspend.service"
[Unit]
Description=Correct suspend for gnome-shell under nvidia driver
Before=systemd-suspend.service
Before=systemd-hibernate.service
Before=nvidia-suspend.service
Before=nvidia-hibernate.service

[Service]
Type=oneshot
ExecStart=/usr/bin/killall -STOP gnome-shell

[Install]
WantedBy=systemd-suspend.service
WantedBy=systemd-hibernate.service
EOF


cat <<EOF > "$SYSTEMD_DIR/nvidia-gnome-resume.service"
[Unit]
Description=Correct resume for gnome-shell under nvidia driver
After=systemd-suspend.service
After=systemd-hibernate.service
After=nvidia-resume.service

[Service]
Type=oneshot
ExecStart=/usr/bin/killall -CONT gnome-shell

[Install]
WantedBy=systemd-suspend.service
WantedBy=systemd-hibernate.service
EOF


systemctl daemon-reload
systemctl enable nvidia-gnome-suspend.service
systemctl enable nvidia-gnome-resume.service

echo "-- Fixes applied and ready, no reboot required."
