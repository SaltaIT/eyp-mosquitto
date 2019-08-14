class mosquitto::client($package_ensure='installed') inherits mosquitto::params {
  package { $mosquitto::params::package_name_client:
    ensure => $mosquitto::client::package_ensure,
  }
}
