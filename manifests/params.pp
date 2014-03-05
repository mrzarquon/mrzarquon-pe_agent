class pe_agent::params {
  if $osfamily == 'windows' {
    $config = "${common_appdata}/PuppetLabs/puppet/etc/puppet.conf"
  }
  else {
    $config = '/etc/puppetlabs/puppet/puppet.conf'
  }
  $package_ensure = 'latest'
  $repo_yum = $::servername
  $repo_apt = $::servername
  $agent_server = 'nil'
  $agent_caserver = 'nil'
  $agent_environment = 'nil'
}
