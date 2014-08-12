class { 'java':
  distribution => 'jdk',
  version      => 'latest',
}

class { 'tomcat': }

maven::setup { "maven":
  ensure        => 'present',
  source        => 'apache-maven-3.1.1-bin.tar.gz',
  deploymentdir => '/home/vagrant/apache-maven',
  user          => 'vagrant',
  pathfile      => '/home/vagrant/.bashrc'
}

tomcat::instance { 'tomcat':
  install_from_source => false,
  package_name        => 'tomcat'
}

tomcat::service { 'tomcat':
  use_jsvc     => false,
  use_init     => true,
  service_name => 'tomcat'
}
