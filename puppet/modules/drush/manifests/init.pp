class drush {
  
  exec { 'install drush' :
    cwd => '/home/vagrant',
    user => vagrant,
    command => 'composer global require drush/drush',
    require => Class['composer'],
  }

}

