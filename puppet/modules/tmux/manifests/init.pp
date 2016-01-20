class tmux {

  # Tmux package.
  package { 'tmux' :
    ensure => present,
    require => Class['system_update'];
  }

  # Load tmux config file.
  file { '/home/vagrant/.tmux.conf':
    ensure => present,
    owner => 'vagrant',
    group => 'vagrant',
    mode => '0770',
    source => 'puppet:///modules/tmux/tmux.conf',
    require => Package['tmux'];
  }
}
