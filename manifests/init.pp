# == Class: mco_agents
#
# Full description of class mco_agents here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { mco_agents:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class mco_agents {

  if $aio_agent_version {
    $base_dir = '/opt/puppetlabs/mcollective/plugins/mcollective/agent'
    $svc = 'mcollective'
  }  else
    $base_dir = '/opt/puppet/libexec/mcollective/mcollective/agent'
    $svc = 'pe-mcollective'
  }

  File {
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service[$svc],
  }

  file {"${base_dir}/disk.ddl":
    ensure => file,
    source => 'puppet:///modules/mco_agents/disk.ddl',
  }

  file {"${base_dir}/disk.rb":
    ensure => file,
    source => 'puppet:///modules/mco_agents/disk.rb',
  }
}
