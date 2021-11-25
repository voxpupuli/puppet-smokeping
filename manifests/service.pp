# @summary Manage SmokePing service
class smokeping::service {
  assert_private()

  $ensure = $smokeping::start ? {
    true    => running,
    false   => stopped,
    default => undef,
  }

  service { 'smokeping':
    ensure => $ensure,
    enable => $smokeping::enable,
  }
}
