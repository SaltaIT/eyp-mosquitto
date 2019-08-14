class { 'mosquitto::client': }
class { 'mosquitto': }

mosquitto::user { 'test':
  password => 'test',
}
