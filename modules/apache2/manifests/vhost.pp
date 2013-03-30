define apache2::vhost( $port, $docroot, $ssl=false, $template='apache2/vhost.conf.erb', $priority, $serveraliases = '') {
  include apache2

  file {"/etc/apache2/sites-enabled/${priority}-${name}":
    content => template($template),
    owner => 'root',
    group => 'root',
    mode => '777',
    require => Class["apache2::install"],
    notify => Class["apache2::service"],
  }
}