require "rvm/capistrano"
set :rvm_ruby_string, :local 
set :application, "Design Feed"
set :deploy_to, "/var/www/designfeed"
set :use_sudo, false 
set :repository,  "git://github.com/joshuaswilcox/DesignFeed.git"
set :scm, :git
set :scm_username , "joshuaswilcox"
set :user, "rails_user"
set :deploy_via, :remote_cache

server "198.101.225.12", :app, :web, :db, :primary => true

after 'deploy:update_code', 'deploy:migrate'

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end