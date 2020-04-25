name 'ardentmc_iis'
maintainer 'Daniel Sablosky'
maintainer_email 'DJSablosky@msn.com'
license 'All Rights Reserved'
description 'Installs/Configures IIS'
long_description 'Installs/Configures IIS'
version '1.3.0'
chef_version '>= 12.6'
supports 'windows2012r2'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url ''

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/DJSablosky/my-iis-cookbook.git/'

depends 'iis', '~> 7.2.0'
depends 'iis_urlrewrite', '~> 2.1.0'
depends 'webpi', '~> 4.2.1'
depends 'vcruntime', '~> 1.2.0'
depends 'firefox', '~> 6.0.0'
depends 'notepadpp', '~> 2.0.0'