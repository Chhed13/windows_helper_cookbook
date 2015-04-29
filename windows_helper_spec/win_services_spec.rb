require 'chefspec'
require 'chefspec/berkshelf'
#ChefSpec::Coverage.start!

#Working directory should be D:\WA.Chef\cookbooks\windows_helper\spec and include metadata.rb and BerksFile
#do not use cookbook_path: parameter in Runner, or Berkshelf will not work

describe "windows_helper_spec::test_service" do

  let(:chef_run) do

    ChefSpec::SoloRunner.new(:log_level => :info,
               step_into: ['windows_helper_service']) do |node|
    end.converge(described_recipe)
  end

  it 'does something' do
    expect(chef_run)
  end
end