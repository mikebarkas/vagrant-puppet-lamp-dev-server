class vim {

  # Vim package.
  package { 'vim' :
    ensure => present,
    require => Class['system_update'];
  }

  # Load Vim config file.
  file { '/home/vagrant/.vimrc':
    ensure => present,
    owner => 'vagrant',
    group => 'vagrant',
    mode => '0770',
    source => 'puppet:///modules/vim/vimrc',
    require => Package['vim'];
  }
}
