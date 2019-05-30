remote_file 'C:\Users\sldev\Documents\chrome_installer.exe' do
  source node.remote_files.chrome
  action :create
end

#'http://dl.google.com/chrome/install/375.126/chrome_installer.exe'

powershell_script 'Chrome' do
  guard_interpreter :powershell_script
  code 'start-process -FilePath "C:\Users\sldev\Documents\chrome_installer.exe"'
  not_if 'test-path -path "C:\Program Files (x86)\Google\Chrome"'
end

windows_package 'C:\Users\sldev\Documents\chrome_installer.exe' do
  action :remove
end