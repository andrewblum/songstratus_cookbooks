# setup script here

include_recipe "ruby-ng::dev"
include_recipe "nodejs"
include_recipe "nodejs::npm"
include_recipe "postgres"
include_recipe "nginx"
include_recipe "unicorn"

apt_package 'zlib1g-dev'
apt_package 'libpq-dev'

template "songstratus_service" do
    path "/etc/init.d/songstratus"
    source "songstratus_service.erb"
    owner "root"
    group "root"
    mode "0755"
end

service "songstratus" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action [ :enable ]
end

template "#{node['nginx']['dir']}/sites-available/songstratus" do
  source 'songstratus_site.erb'
  notifies :reload, 'service[nginx]', :delayed
end

nginx_site 'songstratus' do
  action :enable
end

directory '/tmp/sockets/' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

unicorn_config "/opt/unicorn.rb" do
  listen ({"unix:/tmp/sockets/unicorn.sock": nil})
  working_directory node[:songstratus][:path]
  # /config/unicorn.rb
end
