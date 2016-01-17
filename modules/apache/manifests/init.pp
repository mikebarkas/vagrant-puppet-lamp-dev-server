class apache {
  
  # Apache packages
  package { 'apache2' :
    ensure => present,
    require => Class['system_update'];
  }

  # Apache service
  service { 'apache2' :
    ensure => 'running',
    require => Package['apache2'];
  }

  # Apache config
  file { '/var/www/index.html' :
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0754',
    source => 'puppet:///modules/apache/index.html',
    require => Package['apache2'];
  }
}