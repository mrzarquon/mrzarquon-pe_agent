class pe_agent (
  $config = $pe_agent::params::config,
  $package_ensure = $pe_agent::params::package_ensure,
  $repo_yum = $pe_agent::params::repo_yum,
  $repo_apt = $pe_agent::params::repo_apt,
  $agent_server = $pe_agent::params::agent_servername,
  $agent_caserver = $pe_agent::params::agent_caservername,
  $agent_environment = $pe_agent::params::agent_environment,
) inherits ntp::params {

  validate_absolute_path($config)
  validate_string($package_ensure)
  validate_string($repo_yum)
  validate_string($repo_apt)
  validate_string($agent_server)
  validate_string($agent_caserver)
  validate_string($agent_environment)

  include pe_agent::install
  include pe_agent::config
  include pe_agent::service

}
