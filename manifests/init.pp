class pe_agent (
  pe_master          => $server,
  pe_yumrepo         => $server,
  pe_aptrepo         => $server,
  pe_install_version => $pe_version,
) {

  case $osfamily ? {
    RedHat: { include pe_agent::yum },
    Debian: { include pe_agent::apt },
    default: { notice  ( "this is for RedHat and Debian" ) },
  }

  package { 'pe-agent':
    ensure => $pe_install_version,
  }


}
