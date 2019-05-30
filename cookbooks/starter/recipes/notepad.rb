remote_file 'C:\Users\sldev\Documents\npp.7.6.4.Installer.exe' do
  source 'http://kvh-ca-kate02.ca.kronos.com:8080/userContent/software/window/npp.7.6.4.Installer.exe'
  action :create
end

powershell_script 'Notepad++' do
  guard_interpreter :powershell_script
  code 'start-process -FilePath "C:\Users\sldev\Documents\npp.7.6.4.Installer.exe" -ArgumentList "/S" -Verb runas -Wait'
  not_if 'test-path -path "C:\Program Files\Notepad++"'
end

file 'C:\Users\sldev\Documents\npp.7.6.4.Installer.exe' do
  action :delete
end
