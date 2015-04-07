# Class: pe_agent
#
# This class manages the Puppet Enterprise (PE) agent.
#
# Parameters:
#
# Actions:
#   - Configure PE agent
#   - Upgrade PE agent if required
#   - Manage pe-puppet service
#
# Requires:
#
# Sample Usage:
#
class pe_agent (
  $config = $pe_agent::params::config,
  $package_ensure = $pe_agent::params::package_ensure,
  $master = $pe_agent::params::master,
  $agent_server = $pe_agent::params::agent_servername,
  $agent_caserver = $pe_agent::params::agent_caservername,
  $agent_environment = $pe_agent::params::agent_environment,
  $staging_dir = $pe_agent::params::staging_dir,
  $windows_source = $pe_agent::params::windows_source,
  $version = $pe_agent::params::version,
) inherits pe_agent::params {

  validate_absolute_path($config)
  validate_string($package_ensure)
  validate_string($master)
  validate_string($agent_server)
  validate_string($agent_caserver)
  validate_string($agent_environment)

  class { '::pe_agent::install': } ->
  class { '::pe_agent::config': } ->
  class { '::pe_agent::service': }

}
