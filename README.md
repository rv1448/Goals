sudo apt update
sudo apt update && sudo apt upgrade -y 
sudo apt install git-all
sudo apt install vim





## Sublime text 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text


## Awscli
sudo apt install curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install



## Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

## install Vscode 
sudo snap install --classic code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

## dconf editor
## gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
