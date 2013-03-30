include vim
include apache2

apache2::vhost { 'localhost':
  port => 80,
  docroot => '/vagrant',
  ssl => false,
  priority => 10,
  serveraliases => 'localhost',
}