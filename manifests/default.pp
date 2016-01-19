Exec { path => [ "/bin/", "/sbin/", "/usr/bin/", "/usr/sbin" ] }

#
# Include Modules.
#
include system_update
include apache
include php
#include mariadb
#include composer
