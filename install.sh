#!/usr/bin/sudo bash

# update local install files ownership to root
chown -R root:root usr etc

# making system directory for stamps
mkdir -p /var/lib/update-notifier

# making directory for update-motd support scripts
chmod -R +x usr
mkdir -p /usr/lib/update-notifier
mv usr/lib/update-notifier/* /usr/lib/update-notifier
ln -s apt_check.py /usr/lib/update-notifier/apt-check
mkdir -p /usr/share/update-notifier
mv usr/share/update-notifier/* /usr/share/update-notifier

# moving update-motd.d scripts to local filesystem
chmod -R +x etc/update-motd.d
mv etc/update-motd.d/* /etc/update-motd.d

# moving update-motd.d scripts to local filesystem
mv etc/apt/apt.conf.d/* /etc/apt/apt.conf.d/

# move and setup services
mv etc/systemd/system/* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now update-notifier.timer