class pe_agent::yum inherits pe_agent {
  if $package_ensure == 'latest' {
    $package_version = 'current'
  } else {
    $package_version = $package_ensure
  }

  yumrepo { 'puppetlabs-pepackages':
    baseurl   => "https://${master}:8140/packages/${package_version}/${::platform_tag}",
    descr     => "Puppet Labs PE Packages version: ${package_version}",
    enabled   => true,
    gpgcheck  => true,
    gpgkey    => "https://${master}:8140/packages/GPG-KEY-puppetlabs",
    proxy     => '_none_',
    sslverify => 'False',
    before    => Package['pe-agent'],
  }
}
