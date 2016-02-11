class drush {
  
  exec { 'install drush' :
    command => 'composer global require drush/drush',
    environment => 'COMPOSER_HOME=/home/vagrant/.composer',
    require => Class['composer'],
  }

}

