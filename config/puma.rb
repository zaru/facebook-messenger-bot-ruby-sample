root = "#{Dir.getwd}"

# bind "unix://#{root}/tmp/puma/socket"
bind "tcp://0.0.0.0:9292"
pidfile "#{root}/tmp/puma/pid"
state_path "#{root}/tmp/puma/state"
rackup "#{root}/config.ru"
threads 8, 32
activate_control_app