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
  file { '/etc/apache2/mods-enabled/rewrite.load':
    ensure => link,
    target => '/etc/apache2/mods-available/rewrite.load',
    require => Package['apache2'];
  }

  # Ensure directory exists for vhost.
  file {'/etc/apache2/sites-enabled':
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    before => File['/etc/apache2/sites-enabled/vagrant_app.conf'],
    require => Package['apache2'];
  }

  # Create Vagrant vhost file.
  file { '/etc/apache2/sites-available/vagrant_app.conf':
    ensure => present,
    owner => 'root',
    group => 'www-data',
    mode => '0770',
    source => 'puppet:///modules/apache/vagrant_app.conf',
    require => Package['apache2'];
  }

  # Enable the Vagrant vhost.
  file { '/etc/apache2/sites-enabled/vagrant_app.conf':
    ensure => link,
    target => '/etc/apache2/sites-available/vagrant_app.conf',
    require => File['/etc/apache2/sites-available/vagrant_app.conf'],
    notify => Service['apache2'],
  }

  # Placeholder index file.
  file { '/vagrant/www/index.html' :
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
    mode => '0754',
    source => 'puppet:///modules/apache/index.html',
    require => Package['apache2'];
  }
}
