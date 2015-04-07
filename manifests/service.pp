# manages pe-puppet service state
class pe_agent::service inherits pe_agent {
  service { 'pe-puppet':
    ensure => running,
    enable => true,
  }
}
