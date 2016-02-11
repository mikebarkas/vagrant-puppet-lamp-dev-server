class composer() {

  exec { 'install composer' :
    command => 'curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
    environment => 'COMPOSER_HOME=/home/vagrant/',
    require => Class['Curl'],
  }

}
