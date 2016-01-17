class system_update {
  
  exec { 'apt-get update' :
    command => 'apt-get update'
  }

}