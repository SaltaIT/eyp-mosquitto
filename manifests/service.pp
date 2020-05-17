class mosquitto::service inherits mosquitto {

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
