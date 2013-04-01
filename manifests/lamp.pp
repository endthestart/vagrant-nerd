group { 'puppet': ensure => 'present' }

include apt
include vim
include apache
include apache::mod::php
#include mysql

apache::vhost { 'localhost':
priority => '10',
port => '80',
docroot => '/vagrant',
logroot => '/vagrant/logs',
serveraliases => 'localhost',
configure_firewall => false,
}