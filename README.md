# VagrantBox Setup

1. Download VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads)
2. Download Vagrant from [here](http://www.vagrantup.com/downloads.html)
3. Download optionally a Vagrant plugin to keep your VirtualBox Guest Additions up to date: https://github.com/dotless-de/vagrant-vbguest

Here are my scripts for provisioning a new VagrantBox for web development.
The Vagrantfile include the shell script `bootstrap.sh` from the host and execute this script as the root user within the guest machine.

## Includes

- Ubuntu Server 14.04
- Apache
- PHP 5.5
- Composer
- PHPUnit
- MySQL (Password: root)
- PHPMyAdmin (Access: `http://<servername-or-IP>/phpmyadmin`)
- Joerg's Bash Aliases

## Optional Includes

- NodeJS
- MongoDB
- Rockmongo (MongoDB Admin for PHP, Access: `http://phpinfo.dev/rockmongo-master`, Login: admin)
- Mongo-Express (MongoDB Admin for NodeJS, Access: `http://192.168.56.3:8081`)

After the box has been provisioned, maybe only need to add a entry in the [hosts file](http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file) on the host machine.
Need this for correct dev domain -> IP resolution, for example: `192.168.56.3 phpinfo.dev`.

Everything else is ready to go `vagrant up`.
