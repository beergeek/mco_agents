# == Class: mco_agents
#
# Full description of class mco_agents here.
#
# === Parameters
#
# Document parameters here.
#
# No parameters
#
# === Variables
#
# No variables
#
# === Examples
#
#  class { mco_agents:
#  }
#
# or
#
# include mco_agents
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

  $base_dir = '/opt/puppet/libexec/mcollective/mcollective/agent'

  File {
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['pe-mcollective'],
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
