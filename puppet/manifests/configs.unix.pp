exec { 'apt-get -y update': }
Exec { path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin'] }

package { "curl":              ensure => installed }
package { "build-essential":   ensure => installed }

package { "zsh":               ensure => installed }
package { 'vim':               ensure => installed }

package { "libaugeas-ruby1.9": ensure => installed }
package { "augeas-tools":      ensure => installed }
package { "libaugeas-dev":     ensure => installed }

package { 'libxml2':           ensure => installed }
package { 'libxml2-dev':       ensure => installed }
package { 'libxslt1-dev':      ensure => installed }
