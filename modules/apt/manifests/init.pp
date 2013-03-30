class apt {
  $apt_packages = ['apt', 'dpkg']

  package { $apt_packages:
    ensure => latest,
  }

  exec { 'apt-get-update':
    command => '/usr/bin/apt-get -q -q update',
    logoutput => false,
    refreshonly => true,
  }
}