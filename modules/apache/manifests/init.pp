class apache {
  
  # Apache package.
  package { 'apache2' :
    ensure => present,
    require => Class['system_update'];
  }

  # Start Apache service.
  service { 'apache2' :
    ensure => 'running',
    require => Package['apache2'];
  }

  # Enable rewrite module.
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }

  # Placeholder index file.
  file { '/var/www/index.html' :
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0754',
    source => 'puppet:///modules/apache/index.html',
    require => Package['apache2'];
  }
}
