# # encoding: utf-8

# Inspec test for recipe ardentmc_iis::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

# Test if IIS service is running
describe service('W3SVC') do
  it { should be_installed }
  it { should be_running }
end

# Test if Remote Server Administration Tools are installed
describe windows_feature('ServerManager-Core-RSAT', :dism) do
  it{ should be_installed }
end

# Test if .NET Framework 3.5 Features are installed
describe windows_feature('NET-Framework-Features') do
  it{ should be_installed }
end

# Test if Message Queuing Server is installed
describe windows_feature('MSMQ-Server') do
  it{ should be_installed }
end

# Test if Client for NFS is installed
describe windows_feature('NFS-Client') do
  it{ should be_installed }
end

# Test if Telnet-Client is installed
describe windows_feature('Telnet-Client') do
  it{ should be_installed }
end

# Test if Management Tools is installed
describe windows_feature('Web-Mgmt-Tools') do
  it{ should be_installed }
end

# Test if IIS Management Console is installed
describe windows_feature('Web-Mgmt-Console') do
  it{ should be_installed }
end

# Test if IIS 6 Management Compatibility is installed
describe windows_feature('Web-Mgmt-Compat') do
  it{ should be_installed }
end

# Test if IIS 6 Metabase Compatibility is installed
describe windows_feature('Web-Metabase') do
  it{ should be_installed }
end

# Test if Windows Firewall is disabled

# Test if .NET Framework 4.5 Features are installed
describe windows_feature('NET-Framework-45-Features') do
  it{ should be_installed }
end

# Test if Web Server is installed
describe windows_feature('Web-Server') do
  it{ should be_installed }
end

# Test if Microsoft SQL Server 2012 SP2 Feature Pack was downloaded
describe file('C:\\tmp\\AttunityOracleCdcDesigner.msi') do
  it { should exist }
end