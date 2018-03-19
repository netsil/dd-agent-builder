name             'dd-agent-builder'
maintainer       'Datadog Packages'
maintainer_email 'packages@datadoghq.com'
license          'Simplified BSD License'
description      'Configures OS X/Windows agent builder'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'omnibus', '~> 5.1.0'
depends 'windows', '~> 2.1.1'
depends 'wix', '~> 4.0.0'
