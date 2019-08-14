define mosquitto::user(
                        $password,
                        $username      = $name,
                        $password_file = '/etc/mosquitto/passwd',
                        $order         = '00',
                        $salt          = 'aW5kZXBlbmRlbmNpYQo',
                      ) {
  $password_hash = pw_hash($password, 'SHA-512', $salt)

  concat::fragment{ "passwd ${username}":
    target  => $password_file,
    content => template("${module_name}/passwd_user.erb"),
    order   => '80',
  }
}
