class mysql {
  
  # MySQL packages
  package {['mysql-server',
    'libapache2-mod-auth-mysql',
    'php5-mysql'
    ]:

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
    unless  => 'mysqladmin -uroot -pvagrant status',
    command => 'mysqladmin -uroot password vagrant',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }  

  # Create a database for Drupal.
  exec { 'create database':
    unless => '/usr/bin/mysql -uvagrant -pvagrant drupal',
    command => '/usr/bin/mysql -uroot -pvagrant -e \'create database drupal; grant all on drupal.* to vagrant@localhost identified by "vagrant";\'',
    require => Service['mysql'],
  }
}
