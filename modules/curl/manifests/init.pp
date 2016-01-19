class curl {
  
  exec { 'install curl' :
    cwd => '/home/vagrant',
    command => 'apt-get install curl',
    require => Class['Php'],
  }

}

