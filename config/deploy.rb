set :application, "kadako"
set :repository,  "git@github.com:rebelcolony/kadako.git"
set :rails_env, "production"

set :scm, :git
set :scm_verbose, true
default_run_options[:pty] = true
set :branch, "master"

set :address, "kadako.com"

role :web, address                          # Your HTTP server, Apache/etc
role :app, address                          # This may be the same as your `Web` server
role :db,  address, :primary => true # This is where Rails migrations will run

set :deploy_via, :remote_cache
set :deploy_to, "/var/www/apps/#{application}"
set :user, "rebel"

# SSH Keys
ssh_options[:keys] = %w(/Users/kevin/.ssh/id_rsa)
ssh_options[:port] = 8888

after "deploy:update_code", "recipiez:rename_db_file"
before "deploy:symlink", "deploy:change_owner" 

namespace :deploy do
  task :restart do
    recipiez::restart_passenger
  end
  task :change_owner do
    run "chown -R rebel:rebel #{release_path}"
  end
end

Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'
