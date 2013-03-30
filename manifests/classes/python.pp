class python {
    package { "python-setuptools":
        ensure => installed,
        require => Exec["update-package-list"],
    }

    package { "python-dev":
        ensure => installed,
        require => Exec["update-package-list"],
    }

    package { "python-pip":
        ensure => installed,
        require => Exec["update-package-list"],
    }

    package { "virtualenv":
        ensure => latest,
        provider => pip,
        require => package["python-pip"]
    }
}