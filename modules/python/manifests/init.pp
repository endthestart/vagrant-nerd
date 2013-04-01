class python {
    package { "python-setuptools":
        ensure => installed,
    }

    package { "python-dev":
        ensure => installed,
    }

    package { "python-pip":
        ensure => installed,
    }

    package { "virtualenv":
        ensure => latest,
        provider => pip,
        require => Package["python-pip"]
    }
}