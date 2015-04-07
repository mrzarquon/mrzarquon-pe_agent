# Solaris agent installation
# Solaris doesn't support pe-agent as a package, so we use a modification of 
#  the PE curl-based installation
class pe_agent::solaris inherits pe_agent {
  if $::pe_version != $version {

    case $::platform_tag {
      'solaris-10-i386','solaris-10-sparc' : { $osversion = '10'}
      'solaris-11-i386','solaris-11-sparc' : { $osversion = '11'}
      default : {
        notify { "Unsupported Solaris platform ${::platform_tag}.": }
      }
    }

    file { $staging_dir:
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

    file { "${staging_dir}/solaris-${osversion}-install.bash":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/solaris-${osversion}-install.bash.erb"),
    }->
    exec { "/bin/bash -e ${staging_dir}/solaris-${osversion}-install.bash":
      user => 'root',
    }
  }
}
