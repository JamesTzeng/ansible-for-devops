export GO_VERSION=go1.9.2

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

source ~/.gvm/scripts/gvm

gvm install $GO_VERSION --binary
gvm use $GO_VERSION

gvm list

echo 'gvm use $GO_VERSION' >> ~/.bashrc
