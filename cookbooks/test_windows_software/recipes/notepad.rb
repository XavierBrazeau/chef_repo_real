notepad_installer_path	= node.normal['file_paths']['notepad++']
notepad_url_path		= node.normal['remote_files']['notepad++']
code_string			= 'start-process -FilePath ' + notepad_installer_path + ' -ArgumentList "/S" -Verb runas -Wait'

remote_file notepad_installer_path do
  source notepad_url_path
  action :create
end

powershell_script 'Notepad++' do
  guard_interpreter :powershell_script
  code code_string
  not_if 'test-path -path "C:\Program Files\Notepad++"'
end

file notepad_installer_path do
  action :delete
end
