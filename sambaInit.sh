#! /bin/sh

username="shareuser"
pass="win11"
smbFile="/etc/samba/smb.conf"
sharePath="/mnt/share"

sudo apt-get update 
sudo apt install samba -y
sudo useradd -M $username
sudo mkdir $sharePath
sudo chmod 777 $sharePath

sudo cat >$smbFile <<EOF
[global]
    workgroup = casa
    server string = %h server (Samba, Ubuntu)

[share01]
    comment = Pasta compartilhada
    path = $sharePath
    browseable = yes
    valid users = shareuser
    writable = yes
EOF

sudo echo -e "$pass\n$pass" | smbpasswd -a -s $username
sudo systemctl restart smbd.service
