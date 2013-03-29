class apache2 {
    package { "apache2":
        ensure => installed,
        require => Exec["update-package-list"],
    }
}