#
# Cookbook:: ardentmc_iis
# Recipe:: default
#
# Copyright:: 2019, Daniel Sablosky, All Rights Reserved.

include_recipe 'iis::default'
include_recipe 'iis_urlrewrite'
include_recipe 'webpi'
include_recipe 'vcruntime'
include_recipe 'firefox'
include_recipe 'notepadpp'

# Install Remote Server Administration Tools for non-server release of Windows
windows_feature_dism "ServerManager-Core-RSAT"

# Install Windows features and roles
windows_feature_powershell [
    'NET-Framework-Features', 'NFS-Client', 'MSMQ-Server', 'Telnet-Client', 'Web-Mgmt-Tools', 'Web-Mgmt-Console', 'Web-Mgmt-Compat', 'Web-Metabase'
]

# Install Windows features and all subfeatures
windows_feature_powershell [
    'NET-Framework-45-Features', 'Web-Server'
 ] do
    all true
end

# Disable firewall
case node['platform']
when 'windows'
    powershell_script 'Keeps MpsSvc running but disables firewall' do
        code <<-EOH
          NetSh Advfirewall set allprofiles state off
        EOH
    end
end

# Use Microsoft Web Platform Installer for Application Request Routing
webpi_product 'ARRv3' do
    accept_eula true
    action :install
end

# Create a directory for downloads
directory '/tmp/' do
    owner ENV['USER']
    action :create
end

# Download and install Microsoft SQL Server 2012 SP2 Feature Pack
remote_file '/tmp/AttunityOracleCdcDesigner.msi' do
    source 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=43339'
end

case node['platform']
when 'windows'
    powershell_script 'Install Microsoft SQL Server 2012 SP2' do
        code <<-EOH
          Start-Process 'C:\\tmp\\AttunityOracleCdcDesigner.msi'
        EOH
    end
end