class mysql {
  
  # MySQL packages
  package {['mysql-server',
            'libapache2-mod-auth-mysql',
            'php5-mysql']:

    ensure => present,
    require => Class['system_update'],
  }


  # MySQL service
  service { 'mysql' :
    ensure => 'running',
    require => Package['mysql-server'],
  }

  # MySQL root password.
  exec { 'set mysql password':
    unless  => 'mysqladmin -uroot -proot status',
    command => "mysqladmin -uroot password vagrant",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }  
}
