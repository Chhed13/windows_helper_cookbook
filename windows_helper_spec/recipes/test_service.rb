#
# Author:: Andrey Rotchev (<arotchev@wildapricot.com>)
# Cookbook Name:: windows_helper
# Recipe:: test_service
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

windows_helper_service "test_service4" do
  display_name "test_service4"
  description 'testi desc'
  bin_path "C:/test_dir/test_bin.exe"
  recovery_first_failure :restart
  recovery_second_failure :restart
  recovery_subsequent_failures :restart
  restart_after_min 1
  reset_fail_counter_days 1
  startup_type :automatic
  run_as_user '.\Administrator'
  run_as_password 'pass'
  action [:create, :config]
end