class php {

  # PHP packages
  package {['php5',
    'libapache2-mod-php5',
    'php5-gd',
    'php5-cli',
    'php5-curl',
    'php5-xdebug',
  ]:

    ensure => present,
    require => Class['system_update'],
  }

  # PHP config
  file { 'vagrant-php-ini':
    path => '/etc/php5/apache2/conf.d/vagrant-php.ini',
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0775',
    source => 'puppet:///modules/php/vagrant-php.ini',
    require => Package['php5'],
    notify => Service['apache2'],
  }
}
