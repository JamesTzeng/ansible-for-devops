bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

source ~/.gvm/scripts/gvm

gvm install go1.9.2 --binary
gvm use go1.9.2

gvm list