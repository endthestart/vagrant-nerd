class git::uninstall {
  package { ['git', 'git-core', 'git-common']:
    ensure => absent,
  }
}