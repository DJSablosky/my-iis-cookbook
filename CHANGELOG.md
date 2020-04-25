# ardentmc_iis CHANGELOG

This file is used to list changes made in each version of the ardentmc_iis cookbook.

# 0.1.0

Initial release.

- Wrapped IIS Cookbook from the Chef Supermarket
- Added unit and functional tests

# 0.2.0

Updated default recipe and functional tests.

- Installs Remote Server Administration Tools for non-server release of Windows as a requirement for the Chef windows_feature_powershell resource
- Installs .NET Framework 3.5 Features
- Installs .NET Framework 4.5 Features and subfeatures
- Installs Client for NFS
- Installs Message Queuing Server
- Installs Telnet Client
- Installs Web Server and subfeatures
- Installs Management Tools
- Installs IIS Management Console
- Installs IIS 6 Management Compatibility
- Installs IIS 6 Metabase Compatibility

# 0.3.0

Updated default recipe and metadata.

- Added PowerShell code to disable firewall on Windows Server 2012 R2
- Updated metadata ruby from chef_version '>= 13.0' to chef_version '>= 12.6' for compatibility with iis_urlrewrite Cookbook from Supermarket
- Installs IIS URL Rewrite 2.0 extension into IIS
- Installs Microsoft Web Platform Installer
- Uses Microsoft Web Platform Installer for Application Request Routing 3.0
- Installs latest Microsoft Visual C++ runtime

# 0.4.0

Updated default recipe and functional tests.

- Downloads and installs Microsoft SQL Server 2012 SP2 Feature Pack

# 0.5.0

Updated default recipe, metadata, and functions tests.

- Installs Mozilla Firefox and Notepad++ 

# 0.6.0

Updated README and metadata.

# 1.0.0

Updated README and metadata.

# 1.1.0

Updated .kitchen.yml for client to accept Chef license and use product version 14 due to incompatibility with Chef Infra Server.
Updated README for node bootstrap and client run

# 1.2.0

Updated README and metadata.

# 1.3.0

Updated README and metadata.