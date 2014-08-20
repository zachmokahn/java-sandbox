include tomcat
include git

class { 'java':
  distribution => 'jdk',
  version      => 'latest',
}

maven::setup { 'vagrant':
  ensure        => 'present',
  source        => 'apache-maven-3.1.1-bin.tar.gz',
  deploymentdir => '/home/vagrant/apache-maven',
  user          => 'vagrant',
  pathfile      => '/home/vagrant/.bashrc'
}

tomcat::install { 'vagrant':
  source        => 'apache-tomcat-7.0.55.tar.gz',
  deploymentdir => '/home/vagrant/apache-tomcat',
  user          => 'vagrant',
  group         => 'vagrant',
  default_webapp_docs        => 'present',
  default_webapp_examples    => 'present',
  default_webapp_hostmanager => 'present',
  default_webapp_manager     => 'present',
  default_webapp_root        => 'present'
}

file { '/home/vagrant/apps/warfiles':
  owner => 'vagrant',
  group => 'vagrant',
  ensure => 'link',
  target => '/home/vagrant/apache-tomcat/webapps',
}

file { '/usr/local/bin/catalina':
  owner => 'vagrant',
  group => 'vagrant',
  ensure => 'link',
  target => '/home/vagrant/apache-tomcat/bin/catalina.sh',
 }

import "custom.pp"
