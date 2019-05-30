remote_file 'C:\Users\sldev\Documents\zulu8.15.0.1-jdk8.0.92-win_x64.msi' do
  source 'http://kvh-ca-kate02.ca.kronos.com:8080/userContent/software/window/zulu8.15.0.1-jdk8.0.92-win_x64.msi'
  action :create
end

powershell_script 'zulu' do
  guard_interpreter :powershell_script
  code 'msiexec.exe /I C:\Users\sldev\Documents\zulu8.15.0.1-jdk8.0.92-win_x64.msi /quiet'
  not_if 'test-path -path "C:\Program Files\Zulu"'
end

file 'C:\Users\sldev\Documents\zulu8.15.0.1-jdk8.0.92-win_x64.msi' do
  action :delete
end