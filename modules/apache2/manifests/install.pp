class apache2::install {
  package { [ 'apache2' ]:
    ensure => latest,
  }
  # get rid of the default debian vhost
  file { '/etc/apache2/sites-enabled/000-default':
    ensure  => absent,
    require => Package['apache2'],
    notify  => Service['apache2'],
  }
}