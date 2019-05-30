remote_file 'C:\Users\sldev\Documents\Firefox Installer.exe' do
  source 'https://download-origin.cdn.mozilla.net/pub/firefox/releases/67.0/win64-EME-free/en-US/Firefox Setup 67.0.exe'
  action :create
end

powershell_script 'firefox' do
  guard_interpreter :powershell_script
  code 'start-process -FilePath "C:\Users\sldev\Documents\Firefox Installer.exe"'
  not_if 'test-path -path "C:\Program Files\Mozilla Firefox"'
end

file 'C:\Users\sldev\Documents\Firefox Installer.exe' do
  action :delete
end