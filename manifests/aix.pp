# AIX agent installation
# AIX doesn't support pe-agent as a package, so we use a modification of 
#  the PE curl-based installation
class pe_agent::aix inherits pe_agent {
  if $::pe_version != $version {

    file { $staging_dir:
      ensure => directory,
      owner  => 'root',
      group  => 'system',
      mode   => '0755',
    }

    file { "${staging_dir}/aix-install.bash":
      ensure  => file,
      owner   => 'root',
      group   => 'system',
      mode    => '0644',
      content => template("${module_name}/aix-install.bash.erb"),
    } ->
    exec { "/bin/bash -e ${staging_dir}/aix-install.bash":
      user => 'root',
    }
  }
}
