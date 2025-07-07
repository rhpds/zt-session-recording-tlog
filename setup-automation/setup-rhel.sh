#!/bin/bash
# Create an output file
#touch /root/post-run.log
# configure rhel account
#usermod -aG wheel rhel
#echo redhat | passwd --stdin rhel

#subscription-manager register --activationkey=${ACTIVATION_KEY} --org=12451665 --force

#dnf -y install sssd-proxy

# setup webui
# Create a done file to signal we have finished
#touch /root/post-run.log.done

# Enable cockpit functionality in showroom.
echo "[WebService]" > /etc/cockpit/cockpit.conf
echo "Origins = https://cockpit-${GUID}.${DOMAIN}" >> /etc/cockpit/cockpit.conf
echo "AllowUnencrypted = true" >> /etc/cockpit/cockpit.conf
systemctl enable --now cockpit.socket

# Create rhel user and set password
useradd rhel
usermod -aG wheel rhel