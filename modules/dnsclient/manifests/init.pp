class dnsclient {

    $initial_array = hiera_array('dns_servers')
    $dns_servers = order_using_ip($initial_array,$ipaddress)

    file { "/etc/resolv.conf":
        owner => root,
        group => root,
        mode => 644,
        content => template("dnsclient/resolv.conf.erb")
    }
}

