require 'chefspec'
require 'chefspec/berkshelf'

#Working directory should be .\cookbooks\windows_helper\spec and include metadata.rb and BerksFile
#do not use cookbook_path: parameter in Runner, or Berkshelf will not work

describe "windows_helper_spec::test_junction" do

  let(:chef_run) do

    ChefSpec::SoloRunner.new(:log_level => :info,
               step_into: ['']) do |node|
    end.converge(described_recipe)
  end

  it 'create junction' do
    expect(chef_run)
  end
end