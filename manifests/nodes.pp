include apt
include vim
include apache
#include mysql

#apache2::vhost { 'localhost':
#  port => 80,
#  docroot => '/vagrant',
#  ssl => false,
#  priority => 10,
#  serveraliases => 'localhost',
#}

apache::vhost { 'localhost':
  priority => '10',
  port => '80',
  docroot => '/vagrant',
  logroot => '/vagrant/logs',
  serveraliases => 'localhost',
  configure_firewall => false,
}