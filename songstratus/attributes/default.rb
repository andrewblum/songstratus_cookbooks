
default['ruby-ng']['ruby_version'] = "2.4"
default['nodejs']['version'] = "6.10.1"
default['nodejs']['npm']['version'] = "5.2.0"
default['nginx']['default_site_enabled'] = false

default[:songstratus][:git_repository] = "https://github.com/andrewblum/songstratus/"
default[:songstratus][:git_revision] = "master"
default[:songstratus][:path] = "/opt/songstratus"

default[:songstratus][:rails_env] = "production"
default[:songstratus][:log_to_stdout] = "true"


default[:songstratus][:s3_bucket] = "songstratus-pro"
default[:songstratus][:s3_region] = "us-west-1"

default[:songstratus][:environment] = {
  "SECRET_KEY_BASE": node[:songstratus][:secret_key_base],
  "DATABASE_URL": node[:songstratus][:database_url],
  "RAILS_ENV": node[:songstratus][:rails_env],
  "RAILS_LOG_TO_STDOUT": node[:songstratus][:log_to_stdout],
  "s3_bucket": node[:songstratus][:s3_bucket],
  "s3_region": node[:songstratus][:s3_region],
  "s3_access_key_id": node[:songstratus][:s3_access_key_id],
  "s3_secret_access_key": node[:songstratus][:s3_secret_access_key]
}

default[:songstratus][:start_cmd] = "unicorn -E production -c /opt/unicorn.rb"
