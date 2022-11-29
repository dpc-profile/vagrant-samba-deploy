#! /bin/sh

username="shareuser"
pass=""
smbFile="/etc/samba/smb.conf"

sudo apt-get update 
sudo apt install samba -y
sudo useradd -M $username
sudo mkdir /media/share
sudo chmod 777 /media/share

sudo rm -f $smbFile
sudo touch $smbFile
sudo echo $smb > $smbFile
sudo cat >$smbFile <<EOF
[global]
    workgroup = casa
    server string = %h server (Samba, Ubuntu)

[share01]
    comment = Pasta compartilhada
    path = /media/share
    browseable = yes
    valid users = shareuser
    writable = yes
EOF

sudo echo -e "$pass\n$pass" | smbpasswd -a -s $username
sudo systemctl restart smbd.service
