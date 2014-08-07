#java-sandbox

Build a basic Vagrant box set for Java development with JDK and Maven via puppet

## Installation
* Download and Install [Vagrant](http://www.vagrantup.com/)
* Clone this repo

  ```bash
  git clone https://github.com/zachmokahn/java-sandbox.git
  ```

* CD into the directory

  ```bash
  cd java-sandbox
  ```

* Collect the submodules

  ```bash
  git submodule update --init
  ```

* Get Maven

  ```bash
   mkdir puppet/modules/maven/files
   curl -o puppet/modules/maven/files/apache-maven-3.1.1-bin.tar.gz http://www.trieuvan.com/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
  ```
* Fire up Vagrant

  ```bash
  vagrant up
  ```

## Usage
__Synced Folders:__
*  `app` is sync'd to `home/vagrant/app`

__Port Forwarding:__
* 3306 -> 3306
* 5432 -> 5432
* 7990 -> 7990
* 8080 -> 8080

## Installed modules
* [Java](https://github.com/puppetlabs/puppetlabs-java)
* [Maven](https://github.com/7terminals/puppet-maven)
* [apt](https://github.com/puppetlabs/puppetlabs-apt)
* [stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
* [concat](https://github.com/ripienaar/puppet-concat)
* [firewall](https://github.com/puppetlabs/puppetlabs-firewall)

