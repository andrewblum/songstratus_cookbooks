
default['ruby-ng']['ruby_version'] = "2.4"
default['nodejs']['version'] = "6.10.1"
default['nodejs']['npm']['version'] = "5.2.0"
default['nginx']['default_site_enabled'] = false

default[:songstratus][:git_repository] = "https://github.com/andrewblum/songstratus/"
default[:songstratus][:git_revision] = "master"
default[:songstratus][:path] = "/opt/songstratus"

default[:songstratus][:rails_env] = "production"
default[:songstratus][:log_to_stdout] = "true"

default[:songstratus][:environment] = {
  "SECRET_KEY_BASE": node[:songstratus][:secret_key_base],
  "DATABASE_URL": node[:songstratus][:database_url],
  "RAILS_ENV": node[:songstratus][:rails_env],
  "RAILS_LOG_TO_STDOUT": node[:songstratus][:log_to_stdout]
}

default[:songstratus][:start_cmd] = "unicorn -E production -c /opt/unicorn.rb"
