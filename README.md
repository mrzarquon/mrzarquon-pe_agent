#pe\_agent

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with pe_agent](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

##Overview

The pe\_agent module installs, configures and manages the Puppet Enterprise Agent software and the pe-puppet service (the pe-mcollective components are managed by a different module).

##Module Description

The pe\_agent module is dependent on the PE Package Repositories (pe_repo classes) available on any Puppet Enterprise Master version 3.2 or greater. This module was designed so that PE users can easily upgrade their managed PE agents after a version upgrade of a deployment's PE server(s).

##Setup

###What pe\_agent affects

* pe-agent package (and pe-\* packages related to PE)
* /etc/puppetlabs/puppet/puppet.conf configuration file.
* pe-puppet service.

###Beginning with pe\_agent

`include '::pe_agent'` is enough to get you up and running.

```puppet
class { '::pe_agent':
  agent_caserver => 'puppetca.company.lan',
  windows_source => '\\myfileserver\pe-agent'
}
```

###Parameters

The following parameters are available in the pe_agent module:

####`config`

Path to the puppet.conf file (defaults to /etc/puppetlabs/puppet/puppet.conf)

####`package_ensure`

Version of pe-agent to ensure, by default this is set to latest, and uses the 'current'
package repository on the master. *this will auto upgrade agents if master is updated*

If you specify a version number, it may cause issues with general vs specific version
differences (ie 3.2.0 vs 3.2.0.el6.1).

####`master`

Hostname of yum repository with pe-agent packages on it, assumes the hostname is of a PE master
with the pe_repo class properly applied to it.  Defaults to the PE master that compiled
the agent's catalog.

####`agent_server` & `agent_caserver` & `agent_environment`

Sets the server, ca_server and environment settings on the agents puppet.conf file.

Defaults to nil and does not manage the settings unless overridden in node classification.

####`staging_dir`

The directory that will be used on AIX and Solaris hosts to temporarily hold the
PE Agent installation files.  This defaults to PE's default:

  /tmp/puppet-enterprise-installer

####`windows_source`

A UNC path to a publicly-readable SMB share that contains the PE Agent for Windows
MSI files.  Ensure that both 32-bit and 64-bit installers are hosted there; the 
default file names are assumed.

####`version`

The desired version of the agent to install.  This is applicable to the AIX,
Solaris, and Windows agents since they don't support package => latest.  This
defaults to the version of PE on the agent (which means agent upgrades are armed
unless a newer version is set in the class declaration or hieradata).



##Limitations

This module has been tested only on upgrading EL 6 3.1 agent to 3.2, note lack of
tests folder or spec tests, and the 0.0.X status :-D
