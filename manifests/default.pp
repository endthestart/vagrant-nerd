group { 'puppet': ensure => 'present' }

exec { "update-package-list":
    command => "/usr/bin/sudo /usr/bin/apt-get update",
}

import "classes/*"
import "nodes.pp"