class pe_agent::config inherits pe_agent {

  Ini_setting {
    ensure  => present,
    path    => $config,
    section => 'main',
    require => File[$config],
    notify  => Service['pe-puppet'],
  }

  case $::osfamily {
    'windows': {
      file { $config:
        ensure => file,
      }
    }
    default: {
      file { $config:
        ensure => file,
        owner  => 'pe-puppet',
        group  => 'pe-puppet',
        mode   => '0600',
      }
    }
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

  if $agent_fileserver != 'nil' {
    ini_setting { 'agent_fileserver':
      setting => 'archive_file_server',
      value   => $agent_fileserver,
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
