class git {
  package { 'git':
    ensure => latest,
    require => Exec['apt-get-update'],
  }
}