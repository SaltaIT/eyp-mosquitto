class mosquitto::params {

  $package_name='mosquitto'
  $package_name_client='mosquitto-clients'
  $service_name='mosquitto'

  case $::osfamily
  {
    'Debian':
    {
      case $::operatingsystem
      {
        'Debian':
        {
          case $::operatingsystemrelease
          {
            /^10.*$/:
            {
            }
            default: { fail("Unsupported Debian version! - ${::operatingsystemrelease}")  }
          }
        }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
