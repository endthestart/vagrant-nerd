group { 'puppet': ensure => 'present' }

# --- Preinstall Stage

stage { 'preinstall':
  before => Stage['main']
}

class { 'apt':
  always_apt_update => true,
  stage => preinstall
}

# --- Apache

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

# --- MySQL

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

# --- Development Tools

include vim