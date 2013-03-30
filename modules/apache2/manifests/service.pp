class apache2::service {
  service { 'apache2':
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["apache2::install"],
  }
}