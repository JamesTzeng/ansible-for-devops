cd ~/.ssh

ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ls ~/.ssh 

chmod 700 ~/.ssh 
chmod 600 ~/.ssh/authorized_keys

mkdir -p ~/.ssh

scp ~/.ssh/authorized_keys root@{{ host can login here}} >>:~/.ssh/


