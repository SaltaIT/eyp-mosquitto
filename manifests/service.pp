class mosquitto::service inherits mosquitto {

  #
  validate_bool($mosquitto::manage_docker_service)
  validate_bool($mosquitto::manage_service)
  validate_bool($mosquitto::service_enable)

  validate_re($mosquitto::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${mosquitto::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $mosquitto::manage_docker_service)
  {
    if($mosquitto::manage_service)
    {
      service { $mosquitto::params::service_name:
        ensure => $mosquitto::service_ensure,
        enable => $mosquitto::service_enable,
      }
    }
  }
}
