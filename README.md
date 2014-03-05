#pe\_agent

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ntp](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

##Overview

The pe\_agent module installs, configures and manages the Puppet Enterprise Agent's pe-puppet service (the pe-mcollective components are managed by a different module).

##Module Description

The pe\_agent module is dependent on the PE Package Repositories available on any Puppet Enterprise Master version 3.2 or greater. This module was designed so that PE users who have recently upgraded to PE 3.2 can now easily upgrade their > 3.2 PE agents.

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
}
```

###Parameters

The following parameters are available in the ntp module:

####`config`

Path to the puppet.conf file (defaults to /etc/puppetlabs/puppet/puppet.conf)

####`package_ensure`

Version of pe-agent to ensure, by default this is set to latest, and uses the 'current'
package repository on the master. *this will auto upgrade agents if master is updated*

If you specify a version number, it may cause issues with general vs specific version
differences (ie 3.2.0 vs 3.2.0.el6.1).

##Limitations

This module has been tested only on upgrading EL 6 3.1 agent to 3.2, note lack of 
tests folder or spec tests, and the 0.0.X status :-D

