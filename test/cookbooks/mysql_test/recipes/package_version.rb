mysql_client_installation_package 'default' do
  action :create
end

mysql_client_installation_package 'with a specified package version' do
  package_version 'the-specified-package_version'
  action :create
end

mysql_server_installation_package 'default' do
  action :install
end

mysql_server_installation_package 'with a specified package version' do
  package_version 'the-specified-package_version'
  action :install
end