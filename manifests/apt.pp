class pe_agent::apt inherits pe_agent {
  if $package_ensure == 'latest' {
    $package_version = 'current'
  } else {
    $package_version = $package_ensure
  }

  file { '/etc/apt/puppet-enterprise.gpg.key':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/${module_name}/puppet-enterprise.gpg.key",
  }

  apt_key { 'puppetlabs-pepackages':
    ensure => 'present',
    id     => '4BD6EC30',
    source => '/etc/apt/puppet-enterprise.gpg.key',
  }

  apt::conf { 'puppetlabs-pepackages':
    priority => '90',
    content  => template("${module_name}/apt.conf.erb"),
  }

  apt::source { 'puppetlabs-pepackages':
    location    => "https://${master}:8140/packages/${package_version}/${::platform_tag}",
    repos       => './',
    include_src => false,
    release     => '',     # release name not required
    before      => Package['pe-agent'],
  }
}
