class composer() {

  exec { 'install composer' :
    cwd => '/home/vagrant',
    user => vagrant,
    command => 'curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer',
    creates => '/home/vagrant/composer.phar',
    require => Class['Curl'],
  }

}
