# Windows package installation
# The Windows pe-agent files are not hosted in pe_repo, so we use a UNC share
#  to hold the PE agent MSIs, which are installed by the Windows package
#  provider
class pe_agent::windows inherits pe_agent {
  case $::architecture {
    'x86': {
      $package_msi  = "puppet-enterprise-${version}.msi"
      $package_name = 'Puppet Enterprise'
    }
    'x64': {
      $package_msi  = "puppet-enterprise-${version}-x64.msi"
      $package_name = 'Puppet Enterprise (64-bit)'
    }
    default: {
      notify { "Unsupported Windows architecture ${::architecture}.": }
    }
  }

  package { $package_name:
    ensure          => $version,
    source          => "${windows_source}\\${package_msi}",
    install_options => ["PUPPET_MASTER_SERVER=${::settings::ca_server}"],
  }
}
