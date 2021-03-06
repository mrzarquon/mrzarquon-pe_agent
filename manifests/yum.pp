class pe_agent::yum inherits pe_agent {
  if $package_ensure == 'latest' {
    $package_version = 'current'
  } else {
    $package_version = $package_ensure
  }

  yumrepo { 'puppetlabs-pepackages':
    baseurl   => "https://${repo_yum}:8140/packages/${package_version}/el-\$releasever-\$basearch",
    descr     => "Puppet Labs PE Packages version: ${package_version}",
    enabled   => '1',
    gpgcheck  => '1',
    gpgkey    => "https://${repo_yum}:8140/packages/GPG-KEY-puppetlabs",
    proxy     => '_none_',
    sslverify => 'False',
    before    => Package['pe-agent'],
  }
}
