class mysql::config {
  file { "/opt/csw/mysql5/my.cnf":
    ensure => present,
    source => "modules/mysql/my.cnf",
    owner => "mysql",
    group => "mysql",
    require => Class["mysql::install"],
    notify => Class["mysql::service"],
  }

  file { "/opt/csw/mysql/var":
    group => "mysql",
    owner => "mysql",
    recurse => true,
    require => File["/opt/csw/mysql/my.cnf"],
  }
}