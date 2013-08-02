require "bundler/capistrano"

set :default_environment, {
  'PATH' => "/home/christian/.rvm/bin:/home/christian/.rvm/gems/ruby-2.0.0-p0/bin:$PATH",
  'RUBY_VERSION' => 'ruby 2.0.0-p0',
  'GEM_HOME'     => '/home/christian/.rvm/gems/ruby-2.0.0-p0',
  'GEM_PATH'     => '/home/christian/.rvm/gems/ruby-2.0.0-p0',
  'BUNDLE_PATH'  => '/home/christian/.rvm/gems/ruby-2.0.0-p0'  # If you are using bundler.
}

load 'deploy/assets'

set :application, "revoter.us"
set :repository,  "https://github.com/awesomizer/revoter.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/home/christian/#{application}/public"
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :keep_releases, 5

#role :web, ""                          # Your HTTP server, Apache/etc
#role :app, ""                          # This may be the same as your `Web` server
#role :db,  "", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
server "173.255.226.98", :app, :web, :db, :primary => true

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
set :user, "christian"  # The server's user for deploys
set :use_sudo, false
set :keep_releases, 5
set :scm_username, "awesomizer" # insert these just before running tasks on server, then delete
set :scm_passphrase, "CfAis333"  # insert these just before running tasks on server, then delete
# Capistrano::CLI.password_prompt " => "

# this copies in the app's config files that contain sensitive data
namespace :config do
  task :configs, :except => { :no_release => true }, :role => :app do
    run "cp -f ~/revoter.us/privates/database.yml #{release_path}/config/database.yml"
    run "cp -f ~/revoter.us/privates/application.yml #{release_path}/config/application.yml"
  end
end

after "deploy:finalize_update", "config:configs" 
after "deploy:restart", "deploy:cleanup"
