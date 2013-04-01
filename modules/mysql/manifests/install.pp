class mysql::install {
  package { [ "mysql5", "mysql5client", "mysql5rt", "mysql5test", "mysql5devel"]:
    ensure => latest,
    require => User["mysql"],
  }

  user { "mysql":
    ensure => present,
    comment => "MySQL User",
    gid => "mysql",
    shell => "/bin/false",
    require => Group["mysql"],
  }

  group { "mysql":
    ensure => present,
  }
}