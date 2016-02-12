## Virtual LAMP Server for Development

Creates an Ubuntu LAMP server for development.

Uses VirtualBox to build with Vagrant and provisioned with Puppet and a little shell.

----

* Ubuntu 14.04 _Trusty_
* Apache2
* MySQL
* PHP5
* PHP Xdebug
* PHPUnit
* Composer
* Git
* Vim
* Tmux
* Zsh
* Drush


### Todo

- [ ] Install Webgrind

----
#### Setup
1. Create a _vagrant sync_ directory called: `www`
2. Run: `vagrant up`

Server includes a _drupal_ database with a _vagrant_ MySQL user.
