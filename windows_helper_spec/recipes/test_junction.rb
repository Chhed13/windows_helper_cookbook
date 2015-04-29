#
# Author:: Andrey Rotchev (<arotchev@wildapricot.com>)
# Cookbook Name:: windows_helper
# Recipe:: test_junction
#
# Copyright (C) 2015 Wild Apricot
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

target = "C:/inetpub/test/test_origin"

directory target do
  recursive true
  action :create
end

#double create then delete
windows_helper_link "C:/inetpub/test/test_link" do
  to target
  link_type :junction
  action [:create, :create, :delete]
end

#switch link from one to another with empty folder
target1 = "C:/inetpub/test/test_origin1"
target2 = "C:/inetpub/test/test_origin2"
directory target1 do
  recursive true
  action :create
end
directory target2 do
  recursive true
  action :create
end
windows_helper_link "C:/inetpub/test/test_link1" do
  to target1
  link_type :junction
  action [:create]
end
windows_helper_link "C:/inetpub/test/test_link1" do
  to target2
  link_type :junction
  action [:create]
end

#symlink and junction to 1 folder at same time
windows_helper_link "C:/inetpub/test/test_link_sym" do
  to target
  link_type :symbolic
  action [:create]
end
windows_helper_link "C:/inetpub/test/test_link_junc" do
  to target
  link_type :junction
  action :create
end

#empty folder was previously exist
link_folder = "C:/inetpub/test/test_prev_created_folder"
directory link_folder do
  action :create
end
windows_helper_link link_folder do
  to target
  link_type :junction
  action :create
end