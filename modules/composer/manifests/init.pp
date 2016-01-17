class composer() {

  exec { 'curl -s getcomposer.org/installer | php -d detect_unicode=Off' :
    cwd => 'home/vagrant',
    creates => 'home/vagrant/composer.phar',
    require => Package['php5-cli'],
  }

  exec { 'mv composer.phar /usr/bin/composer' :
    cwd => 'home/vagrant',
    creates => '/usr/bin/composer',
    require => Exec['curl -s getcomposer.org/installer | php -d detect_unicode=Off'],
  }
}