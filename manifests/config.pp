class mosquitto::config inherits mosquitto {

  file { '/etc/mosquitto/mosquitto.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/mosquittoconf.erb"),
  }

  concat { $mosquitto::password_file:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
