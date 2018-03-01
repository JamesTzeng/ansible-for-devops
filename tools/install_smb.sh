sudo apt-get install -y samba samba-common python-glade2 system-config-samba
sudo cp -pf /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cp -pf /etc/samba/smb.conf ./smb.conf.bak

sudo cat >> /etc/samba/smb.conf <<EOF
[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = ubuntu
security = user
map to guest = bad user
dns proxy = no

#============================ Share Definitions ============================== 

[Anonymous]
path = /samba/anonymous
browsable =yes
writable = yes
guest ok = yes
read only = no
force user = nobody
EOF


sudo mkdir -p /samba/anonymous
sudo chmod -R 0775 /samba/anonymous
sudo chown -R nobody:nogroup /samba/anonymous
sudo service smbd restart


