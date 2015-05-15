include vagrant
include unix_base
include docker
include stdlib

class { '::consul':
  config_hash     => {
    'data_dir'    => '/opt/consul',
    'datacenter'  => 'vagrant',
    'log_level'   => 'INFO',
    'client_addr' => $::ipaddress_eth1,
    'bind_addr' => $::ipaddress_eth1,
    'node_name'   => $::hostname,
    'retry_join'  => ['172.16.3.101'],
  }
}
