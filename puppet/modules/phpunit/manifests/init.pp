class phpunit {
  
  exec { 'install phpunit' :
    command => 'composer global require phpunit/phpunit',
    environment => 'COMPOSER_HOME=/home/vagrant/.composer',
    require => Class['composer'],
  }

}

