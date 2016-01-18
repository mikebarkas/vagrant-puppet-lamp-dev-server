class php {

  # PHP packages
  package {['php5',
            'libapache2-mod-php5',
            'php5-gd',
            'php5-cli',
            'php5-curl']:

    ensure => present,
    require => Class['system_update'],
  }


  # PHP config
  
}