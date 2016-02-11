class drush {
  
  exec { 'install drush' :
    command => 'composer global require drush/drush',
    environment => 'COMPOSER_HOME=/home/vagrant/.composer',
    require => Class['composer'],
  }

  exec { 'alias drush' :
    command => 'echo "alias drush=\"~/.composer/vendor/drush/drush/drush\"" >> /home/vagrant/.zshrc',
    require => Exec['install drush'],
  }

}

