# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'gestao-pessoas'
set :repo_url, 'git@github.com:ZenitAerospace/gestao-pessoas.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, :deploy

# SSH private key storage
set :ssh_options, keys: ["config/deploy/id_rsa_enc_travis"]

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/zenit/gestao-pessoas'

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, false

# While migrations looks like a concern of the database layer.
# Rails migrations are strictly related to the framework. 
set :migration_role, :web

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
set :default_env, { path: "/home/zenit/.rvm/gems/ruby-2.2.1/bin:/home/zenit/.rvm/gems/ruby-2.2.1@global/bin:/home/zenit/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/zenit/.rvm/bin:/home/zenit/.rvm/bin:/home/zenit/.rvm/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3
