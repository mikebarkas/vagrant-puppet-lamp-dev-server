class composer() {

  exec { 'install composer' :
    cwd => '/home/vagrant',
    command => 'curl -s getcomposer.org/installer | php -d detect_unicode=Off',
    creates => '/home/vagrant/composer.phar',
    require => Class['Curl'],
  }

  exec { 'move composer' :
    cwd => '/home/vagrant',
    command => 'mv composer.phar /usr/bin/composer',
    creates => '/usr/bin/composer',
    require => Exec['install composer'],
  }
}
