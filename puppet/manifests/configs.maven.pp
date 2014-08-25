maven::setup { 'vagrant':
  ensure        => 'present',
  source        => 'apache-maven-3.1.1-bin.tar.gz',
  deploymentdir => '/home/apache-maven',
  user          => 'vagrant',
  pathfile      => '/home/vagrant/.zshrc'
}

file { '/home/vagrant/.m2':
  owner => 'vagrant',
  group => 'vagrant',
  ensure => 'directory'
}

file { '/home/vagrant/.m2/repository':
  owner => 'vagrant',
  group => 'vagrant',
  ensure => 'directory'
}
