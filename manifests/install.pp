class mosquitto::install inherits mosquitto {

  if($mosquitto::manage_package)
  {
    package { $mosquitto::params::package_name:
      ensure => $mosquitto::package_ensure,
    }
  }

}
