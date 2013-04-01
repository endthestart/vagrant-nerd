class django (
    $project_path = "",
    $wsgi_module = "wsgi.py",
    $static_path = "${project_path}/static",
    $media_path = "${project_path}/media",
) {
    include python
    include apache::mod::wsgi

    file { "apache-django":
        path    => "/etc/apache2/sites-enabled/000-django.conf",
        content => template("apache/mod/wsgi.conf.erb"),
        notify  => Service['httpd']
    }
}
