## Prerequisites
**You need to install vagrant in your machine**
```bash
sudo apt install vagrant
```
**Install Vagrant plugin for kvm**
```bash
vagrant plugin install vagrant-libvirt
```
## Clone the repository
```
git clone https://github.com/waiiphyo/k8s_vagrant.git
```
## Useful commands
**Provision Infra**
```
vagrant up  
```
**Connect with ssh**
```
vagrant ssh
```
**Stop the VM**
```
vagrant halt
```
**Clean the Infra**
```
vagrant destroy
```