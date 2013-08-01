require "bundler/capistrano"

set :application, "revoter.us"
set :repository,  "https://github.com/awesomizer/revoter.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/home/christian/#{application}/public"
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :keep_releases, 5

role :web, "apache2"                          # Your HTTP server, Apache/etc
role :app, "passenger"                          # This may be the same as your `Web` server
role :db,  "postgresql", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
server "www.revoter.us", :app, :web, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# for getting ssh access to github
ssh_options[:forward_agent] = true

default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :user, "deployer"  # The server's user for deploys
set :use_sudo, false
set :keep_releases, 5
set :scm_passphrase, ""  

namespace :db do
  task :db_config, :except => { :no_release => true }, :role => :app do
    run "cp -f ~/privates/database.yml #{deploy_to}/config/database.yml"
    run "cp -f ~/privates/application.yml #{deploy_to}/config/application.yml"
  end
end

after "deploy:finalize_update", "db:db_config" 
after "deploy:restart", "deploy:cleanup"
