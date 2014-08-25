include tomcat

tomcat::install { 'vagrant':
  source        => 'apache-tomcat-7.0.55.tar.gz',
  deploymentdir => '/home/apache-tomcat',
  user          => 'vagrant',
  group         => 'vagrant',
  default_webapp_docs        => 'present',
  default_webapp_examples    => 'present',
  default_webapp_hostmanager => 'present',
  default_webapp_manager     => 'present',
  default_webapp_root        => 'present'
}

file { '/home/vagrant/apps/.warfiles':
  owner => 'vagrant',
  group => 'vagrant',
  ensure => 'link',
  target => '/home/apache-tomcat/webapps',
}

file { '/usr/local/bin/catalina':
  owner => 'vagrant',
  group => 'vagrant',
  ensure => 'link',
  target => '/home/apache-tomcat/bin/catalina.sh',
}
