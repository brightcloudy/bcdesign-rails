app_path = File.expand_path(File.dirname(__FILE__) + '/..')

worker_processes (ENV['RAILS_ENV'] == 'production' ? 4 : 1)

#You can listen on a port or a socket. Listening on a socket is good in a
# production environment, but listening on a port can be useful for local
# debugging purposes.
listen app_path + '/tmp/unicorn.sock', backlog: 64

# For development, you may want to listen on port 3000 so that you can make sure
# your unicorn.rb file is soundly configured.
listen(3000, backlog: 64) if ENV['RAILS_ENV'] == 'development'

timeout 300

working_directory app_path

pid app_path + '/tmp/unicorn.pid'

stderr_path app_path + '/log/unicorn.log'
stdout_path app_path + '/log/unicorn.log'
preload_app true

GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
