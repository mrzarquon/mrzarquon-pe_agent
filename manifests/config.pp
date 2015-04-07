class pe_agent::config inherits pe_agent {

  Ini_setting {
    ensure  => present,
    path    => $config,
    section => 'main',
    require => File[$config],
  }

  file { $config:
    ensure  => file,
    owner   => 'pe-puppet',
    group   => 'pe-puppet',
    mode    => '0600',
    require => Package['pe-agent'],
  }

  if $agent_server != 'nil' {
    ini_setting { 'agent_server':
      setting => 'server',
      value   => $agent_server,
    }
  }

  if $agent_caserver != 'nil' {
    ini_setting { 'agent_caserver':
      setting => 'ca_server',
      value   => $agent_caserver,
    }
  }

  if $agent_environment != 'nil' {
    ini_setting { 'agent_environment':
      section => 'agent',
      setting => 'environment',
      value   => $agent_environment,
    }
  }
}
