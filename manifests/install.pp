class pe_agent::install inherits pe_agent {
  include ::pe_agent::repo

  package { 'pe-agent':
    ensure  => $package_ensure,
  }
}
