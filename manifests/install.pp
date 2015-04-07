class pe_agent::install inherits pe_agent {
  include ::pe_agent::repo

  case $::osfamily {
    'AIX':     { include ::pe_agent::aix }
    'Debian','RedHat': {
      package { 'pe-agent':
        ensure  => $package_ensure,
      }
    }
    'Solaris': { include ::pe_agent::solaris }
    'windows': { include ::pe_agent::windows }
    default: {
      notify { "Unsupported OS family ${::osfamily}.": }
    }
  }
}
