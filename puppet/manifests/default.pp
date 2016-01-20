Exec { path => [ "/bin/", "/sbin/", "/usr/bin/", "/usr/sbin" ] }

#
# Include Modules.
#
include system_update
include apache
include curl
include composer
include php
include mysql
include tmux
include vim
#include drush
