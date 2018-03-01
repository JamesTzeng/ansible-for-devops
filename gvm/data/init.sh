export GO_VERSION=go1.9.2
export PROJECT_NAME=test_go

mkdir -p ~/go_projects/$PROJECT_NAME
cd ~/go_projects/$PROJECT_NAME 
gvm pkgset create --local 
#gvm pkgset use --local  
go get github.com/constabulary/gb/... 

#gb init
