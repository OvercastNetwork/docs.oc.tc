require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_ruby_string, "ruby-2.1.2"
set :rvm_type, :system

set :application, "docs"
set :repository, "git@github.com:OvercastNetwork/docs.oc.tc.git"

set :scm, :git
set :branch, "master"
set :deploy_to, "/home/deploy/apps/docs"
set :user, "deploy"
set :port, 50210
set :use_sudo, false

server 'chi04.oc.tc', :app, :db, :web, :primary => true

default_environment["RAILS_ENV"] = "production"

set :rails_env, :production

ssh_options[:forward_agent] = true

namespace :deploy do
    task :update do
        update_code
        build_code
        symlink
    end

    task :build_code, :except => { :no_release => true } do
        run "cd #{latest_release} && bundle exec staticmatic build"
    end
end
