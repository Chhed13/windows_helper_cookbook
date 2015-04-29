#
# Author:: Andrey Rotchev (<arotchev@wildapricot.com>)
# Cookbook Name:: windows_helper
# Resource:: link
#
# Copyright:: 2015, WildApricot, Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/resource/link'

class Chef::Resource::WindowsHelperLink < Chef::Resource::Link

  def initialize(name, run_context=nil)
    super
    @resource_name = :windows_helper_link
  end

  def link_type(arg=nil)
    real_arg = arg.kind_of?(String) ? arg.to_sym : arg
    set_or_return(
        :link_type,
        real_arg,
        :equal_to => [ :symbolic, :hard, :junction ]
    )
  end

end