group { 'puppet': ensure => 'present' }

#include apt
include vim
include apache
include apache::mod::php
#include mysql

class { 'apt':
  always_apt_update    => true,
  disable_keys         => undef,
  proxy_host           => false,
  proxy_port           => '8080',
  purge_sources_list   => false,
  purge_sources_list_d => false,
  purge_preferences_d  => false
}

include apt::params
include apt::update

apache::vhost { 'localhost':
  priority => '10',
  port => '80',
  docroot => '/vagrant',
  docroot_owner => 'vagrant',
  docroot_group => 'vagrant',
  logroot => '/vagrant/logs',
  serveraliases => 'localhost',
  configure_firewall => false,
}