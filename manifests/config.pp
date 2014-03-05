class pe_agent::config inherits pe_agent {

  file { $config:
    ensure  => file,
    owner   => pe-puppet,
    group   => pe-puppet,
    mode    => 0600,
    require => Package['pe-agent'],
  }

  if $agent_server != 'nil' {
    ini_setting { "agent_server":
      ensure  => present,
      path    => $config,
      section => 'agent',
      setting => 'server',
      value   => "$agent_server",
      require => File[$config],
    }
  }

  if $agent_caserver != 'nil' {
    ini_setting { "agent_caserver":
      ensure  => present,
      path    => $config,
      section => 'agent',
      setting => 'ca_server',
      value   => "$agent_server",
      require => File[$config],
    }
  }

  if $agent_server != 'nil' {
    ini_setting { "agent_environment":
      ensure  => present,
      path    => $config,
      section => 'agent',
      setting => 'environment',
      value   => "$agent_server",
      require => File[$config],
    }
  }
}
