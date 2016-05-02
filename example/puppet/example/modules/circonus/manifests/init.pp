
class circonus {

    # NAD requires perl, since we're not using YUM or Apt to
    # install it, perl needs to be installed independently.
    package { "perl":
        ensure => present,
    }

    # pre-install any templates, hooks, etc. needed to pre-seed the nad/cosi environment

    exec { "cosi":
        command => "/usr/bin/curl -sSL https://onestep.circonus.com/install | bash -s -- --key ${facts['api_key']} --app ${facts['api_app']} ${facts['extra_options']}",
        creates => "/opt/circonus/cosi",
    }

    # if there are any errors see: /opt/circonus/cosi/log/install.log

}
