class system_update {

  exec { 'system update' :
    cwd => '/home/vagrant',
    command => 'apt-get update'
  }

}
