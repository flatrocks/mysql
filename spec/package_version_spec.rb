require 'spec_helper'
require_relative "../libraries/helpers"

describe 'mysql_test::package_version' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new() do |node|
      allow(MysqlCookbook::HelpersBase).to receive(:default_client_package_name).and_return 'the_default_client_package_name'
      allow(MysqlCookbook::HelpersBase).to receive(:default_server_package_name).and_return 'the_default_server_package_name'
    end.converge(described_recipe)
  end
  describe "the package_version property" do
    context 'when it is not set' do
      it 'no default value is passed to the install package' do
        expect(chef_run).to install_mysql_client_installation_package('default').with(
          package_version: nil
        )
      end
      it 'no default value is passed to the mysql_server_installation_package' do
        expect(chef_run).to install_mysql_server_installation_package('default').with(
          package_version: nil
        )
      end
    end
    context 'when it is set' do
      it 'is passed to the mysql_client_installation_package' do
        expect(chef_run).to install_mysql_client_installation_package('with a specified package version').with(
          package_version: 'the-specified-package_version'
        )
      end
      it 'is passed to the mysql_server_installation_package' do
        expect(chef_run).to install_mysql_server_installation_package('with a specified package version').with(
          package_version: 'the-specified-package_version'
        )
      end
    end
  end
end
