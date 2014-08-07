class { 'java':
  distribution => 'jdk',
  version      => 'latest',
 }

maven::setup { "maven":
  ensure        => 'present',
  source        => 'apache-maven-3.1.1-bin.tar.gz',
  deploymentdir => '/home/vagrant/apps/apache-maven',
  user          => 'vagrant',
  pathfile      => '/home/vagrant/.bashrc'
 }
