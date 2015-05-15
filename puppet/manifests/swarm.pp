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
  command => 'manage -H tcp://0.0.0.0:2376 consul://172.16.3.101:8500/swarm',
  ports   => [ '2376:2376' ],
}

class { '::consul':
  config_hash => {
    'bootstrap_expect' => 1,
    'client_addr'      => '0.0.0.0',
    'data_dir'         => '/opt/consul',
    'datacenter'       => 'vagrant',
    'log_level'        => 'INFO',
    'node_name'        => $::hostname,
    'server'           => true,
    'ui_dir'           => '/opt/consul/ui',
  }
}
