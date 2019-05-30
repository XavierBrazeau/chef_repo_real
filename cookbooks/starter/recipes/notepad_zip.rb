remote_file 'C:\Users\sldev\Documents\notepad.zip' do
  source 'https://notepad-plus-plus.org/repository/7.x/7.6.6/npp.7.6.6.bin.x64.zip'
  action :create
end

powershell_script 'Notepad++_file' do
  guard_interpreter :powershell_script
  code 'mkdir "C:\Program Files\Notepad++"'
  not_if 'test-path -path "C:\Program Files\Notepad++"'
end

powershell_script 'Notepad++' do
  guard_interpreter :powershell_script
  code 'Expand-Archive C:\Users\sldev\Documents\notepad.zip -DestinationPath "C:\Program Files\Notepad++"'
  not_if 'test-path -path "C:\Program Files\Notepad++\notepad++.exe"'
end

file 'C:\Users\sldev\Documents\notepad.zip' do
  action :delete
end



