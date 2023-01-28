#! /bin/sh

username="shareuser"
pass="win11"
smbFile="/etc/samba/smb.conf"
sharePath="/mnt/share"

apt update -y
apt upgrade -y
apt install samba -y
useradd -M $username
mkdir $sharePath
chmod 777 $sharePath

cat >$smbFile <<EOF
[global]
    workgroup = casa
    server string = %h server (Samba, Ubuntu)

[sharedFolder]
    comment = Pasta compartilhada
    path = $sharePath
    browseable = yes
    valid users = shareuser
    writable = yes
EOF

sudo echo -e "$pass\n$pass" | smbpasswd -a -s $username
systemctl restart smbd.service
