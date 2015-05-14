include vagrant
include unix_base
include docker
include stdlib

class { '::consul':
  config_hash => {
    'data_dir'    => '/opt/consul',
    'datacenter'  => 'vagrant',
    'log_level'   => 'INFO',
    'node_name'   => $::hostname,
    'retry_join'  => ['172.16.3.101'],
  }
}
