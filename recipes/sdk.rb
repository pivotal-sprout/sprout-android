package 'android-sdk'

filters = %w(
  build-tools-19.0.3
  platform-tools
  android-19
  addon-google_apis-google-19
  extra-android-m2repository
  extra-android-support
)

execute 'update-sdk-system-tools-and-platforms' do
  command "echo y | android update sdk --no-ui --filter #{filters.join(',')}"
end

atom_system_image_package_id = node['sprout']['android']['atom_system_image_package_id']

execute 'update-sdk-system-images' do
  command "echo y | android update sdk -a --no-ui --filter #{atom_system_image_package_id}"
  user node['current_user']
end
