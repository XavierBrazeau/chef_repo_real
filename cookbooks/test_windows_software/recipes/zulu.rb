zulu_installer_path 	= node.normal['file_paths']['zulu']
zulu_url_path		= node.normal['remote_files']['zulu']
code_string		= 'msiexec.exe /I ' + zulu_installer_path + ' /quiet'

remote_file zulu_installer_path do
  source zulu_url_path
  action :create
end

powershell_script 'zulu' do
  guard_interpreter :powershell_script
  code code_string
  not_if 'test-path -path "C:\Program Files\Zulu"'
end

file zulu_installer_path do
  action :delete
end