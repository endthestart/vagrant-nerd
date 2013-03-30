import "default.pp"

include apache2
include python

file {'/etc/apache2/sites-enabled/default.conf':
  ensure  => file,
  content => template('apache/django.erb'),
}