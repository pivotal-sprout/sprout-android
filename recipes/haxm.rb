include_recipe 'sprout-android::sdk'

haxm_pkg      = node['sprout']['android']['haxm']['package_name']
haxm_dmg_path = node['sprout']['android']['haxm']['dmg_path']

execute 'update-haxm-pkg' do
  command 'echo y | android update sdk --no-ui --filter extra-intel-Hardware_Accelerated_Execution_Manager'
  user node['current_user']
end

sdk_path_prefix_command = Mixlib::ShellOut.new('brew --prefix android-sdk')
sdk_path_prefix_command.run_command
sdk_path_prefix = sdk_path_prefix_command.stdout.strip

link "#{Chef::Config[:file_cache_path]}/#{haxm_pkg}.dmg" do
  to "#{sdk_path_prefix}/#{haxm_dmg_path}" # Symlink to cache dir so dmg_package can load the file
end

dmg_package haxm_pkg do
  source     'http://example.com/' # Hack to keep dmg_package happy. Will not download.
  owner      node['current_user']
  type       'mpkg'
  package_id node['sprout']['android']['haxm']['package_id']
  checksum   node['sprout']['android']['haxm']['checksum']
end
