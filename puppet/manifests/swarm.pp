include vagrant
include unix_base
include stdlib 
include docker 

hiera_include('classes', [])

docker::image { 'swarm':
  ensure    => 'present',
}

docker::run { 'swarm':
  image   => swarm,
  command => 'manage  consul://172.16.3.101:8500/swarm'
}

class { '::consul':
  config_hash => {
    'bootstrap_expect' => 1,
    'client_addr'      => '0.0.0.0',
    'data_dir'         => '/opt/consul',
    'datacenter'       => 'vagrant',
    'log_level'        => 'INFO',
    'node_name'        => 'server',
    'server'           => true,
    'ui_dir'           => '/opt/consul/ui',
  }
}
