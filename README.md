# IIS Cookbook

This is a Chef wrapper cookbook of the IIS Cookbook in the Chef Supermarket deployed on an AWS EC2 instance of a Microsoft Windows Server 2012 R2 platform.

## Installing

berks commands must be run at same level as cookbook

To install the cookbooks specified in the Berksfile:

```bash
berks install
```

## Running the tests

To run all available tests from the root of the cookbook directory:

```bash
chef exec rspec --color -fd
```
Currently, local testing fails due to a bug in the webpi cookbook: https://github.com/chef-cookbooks/webpi/issues/35


To provide a testing harness to execute Chef code on isolated, disposable testing instances:

```bash
kitchen test
```

## Deployment

### Upload ardent_iis cookbook to the Chef server
```
berks upload
```

```
knife cookbook upload ardentmc_iis
```

### Verify cookbook upload
```
knife cookbook list
```

### AWS User Data for Knife Windows
```
<powershell>
$logfile="C:\\Program Files\\Amazon\\Ec2ConfigService\\Logs\\kitchen-ec2.log"
# Allow script execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
# PS Remoting and & winrm.cmd basic config
Enable-PSRemoting -Force -SkipNetworkProfileCheck
& winrm.cmd set winrm/config '@{MaxTimeoutms="1800000"}' >> $logfile
& winrm.cmd set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}' >> $logfile
& winrm.cmd set winrm/config/winrs '@{MaxShellsPerUser="50"}' >> $logfile
#Server settings - support username/password login
& winrm.cmd set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}' >> $logfile
# Firewall Config
& netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" profile=public protocol=tcp localport=5985 remoteip=localsubnet new remoteip=any  >> $logfile
</powershell>
```

### Connect to the node and verify configuration
```
knife wsman test HOSTNAME --manual-list
```

For example:
```
knife wsman test 3.92.201.3 --manual-list
```

### Bootstrap the node

To bootstrap a Windows node with the cookbook, the knife windows plugin is required on the workstation:  https://docs.chef.io/knife_windows.html

```
gem install knife-windows
```

Bootstrap the Windows Server with knife

```
$ knife bootstrap windows winrm ADDRESS --winrm-user USER --winrm-password 'PASSWORD' --node-name node1-windows --run-list 'role[webserver]'
```

For example:

```
knife bootstrap windows winrm 3.92.201.3 --winrm-user Administrator --winrm-password '7pXySo%!Cz' --node-name node1-windows --run-list 'role[webserver]'
```

Confirm the result

```
knife node list
```

View node data

```
knife node show node1-windows
```

Verify configuration

```
curl 3.92.201.3
```

### Force a Chef Infra Client run
```
knife winrm 'ec2-50-xx-xx-124.amazonaws.com' 'chef-client -c c:/chef/client.rb' -m -x admin -P 'password'
```


## Authors
* **Daniel Sablosky** - *Initial work*


