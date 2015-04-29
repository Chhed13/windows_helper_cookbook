Windows Helper Cookbook
================
Extends functionallity of basic (core) Chef resources such as "service", "link"


Requirements
-------------

### Platforms
* Windows 8, 8.1, 7, Vista
* Windows Server 2012 (R1, R2), 2008


Resource/Provider
-----------------
## link (windows_helper_link)
Extends functionality of original "link" resouce/provider with abillity to create junction folders

#### Actions
- same as original

#### Attribute Parameters
- link_type: [:symbolic, :hard, :junction ]
- rest is the same as original

#### Limitations
- "target_file" folder should be empty for ability to change destination. It has in original "link" to.

#### Examples
 `windows_helper_link "C:/test_link" do
   to "C:/test_origin"
   link_type :junction
   action [:create]
 end`

## service (windows_helper_service)
Extends functionality of original "windows_service" resouce/provider with abillity to create, delete, config services

#### Actions
- :create, :delete, :config, :configure_startup, :disable, :enable, :nothing, :reload, :restart, :start, :stop

#### Attribute Parameters
- display_name
- description
- bin_path
- recovery_first_failure, can be [:run, :reboot, :restart, :run_command], default :run
- recovery_second_failure, can be [:run, :reboot, :restart, :run_command], default :run
- recovery_subsequent_failures, can be [:run, :reboot, :restart, :run_command], default :run
- restart_after_min, default 0
- reset_fail_counter_days, default 0
- host, default "localhost"
- rest is the same as original

#### Limitations

#### Examples
`windows_helper_service "test_service4" do
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
end`
