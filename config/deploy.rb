require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_ruby_string, "ruby-1.9.3-p194"
set :rvm_type, :user
set :rvm_path, "$HOME/.rvm"
set :rvm_bin_path, "$HOME/.rvm/bin"

set :application, "docs"
set :repository, "git@github.com:ProjectAres/docs.oc.tc.git"

set :scm, :git
set :branch, "master"
set :deploy_to, "/home/deploy/apps/docs"
set :user, "deploy"
set :port, 50210

server 'dal02.oc.tc', :app, :db, :web, :primary => true

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
        run "bundle exec staticmatic build #{latest_release}"
    end
end
