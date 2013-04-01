group { 'puppet': ensure => 'present' }


stage { 'preinstall':
  before => Stage['main']
}

class { 'apt':
  always_apt_update => true,
  stage => preinstall
}

class { 'apache': }
class { 'apache::mod::php': }

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

class { 'mysql': }
class { 'mysql::php': }
class { 'mysql::server':
config_hash => { 'root_password' => 'nerd' }
}

mysql::db { 'nerddb':
  user => 'nerd',
  password => 'nerd',
  host => 'localhost',
  grant => ['all'],
}

include vim