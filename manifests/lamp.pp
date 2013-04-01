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
apache::mod { 'rewrite': }
class { 'apache::mod::php': }

apache::vhost { 'localhost':
  priority => '10',
  port => '80',
  docroot => '/source/public',
  docroot_owner => 'vagrant',
  docroot_group => 'vagrant',
  logroot => '/source/logs',
  serveraliases => 'localhost',
  configure_firewall => false,
  override => 'All',
}

# --- MySQL

class { 'mysql': }
class { 'mysql::php': }
class { 'mysql::server':
config_hash => { 'root_password' => 'nerd' },
}

mysql::server::config { 'basic_config':
settings => {
'mysqld' => {
'skip-external-locking' => true,
'bind_address' => '0.0.0.0',
},
'client' => {
'port' => 3306
}
}
}

mysql::db { 'nerddb':
  user => 'nerd',
  password => 'nerd',
  host => '%',
  grant => ['all'],
  sql => '/source/data/sql/schema.sql',
}

# --- Development Tools

include vim
