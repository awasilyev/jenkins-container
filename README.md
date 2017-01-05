Jenkins CI
=========

[![Build Status](https://travis-ci.org/awasilyev/jenkins-container.svg?branch=master)](https://travis-ci.org/awasilyev/jenkins-container)

Use this role to add a jenkins CI/CD service to your Ansible Container project. See Role Variables below for how to set the jenkins hostname, plugins, admin credentials and java opts. You can pass additional jenkins options as command for this container. Connect to the jenkins on port 8080.

Run the following commands to install the service:

```
# Set the working directory to your Ansible Container project root
$ cd myproject

# Install the service
$ ansible-container install awasilyev.jenkins-container
```

Envrionment Variables
---------------------

Set the following environment variables in `container.yml`:

JENKINS_HOSTNAME
> jenkins hostname (default: "localhost")

JENKINS_PLUGINS
> comma-separated list of plugins (default: "")

JENKINS_ADMIN_USERNAME
> username for jenkins admin user (default "admin")

JENKINS_ADMIN_PASSWORD
> password for jenkins admin user (default "admin")

JENKINS_JAVA_OPTIONS
> additional options for java (default: "-Djenkins.install.runSetupWizard=false")

Role Variables
--------------

Set the following variables in `main.yml`: 

jenkins_version:
> Set the version to install, for example: 2.37 This is left undefined by default, which causes the latest version to be installed. 

jenkins_hostname: localhost
> Set the hostname.

jenkins_url_prefix: ""
> Set the value of *--prefix* in the Jenkins initialization java invocation, creating an access path like *http://www.example.com{{ jenkins_url_prefix }}*. Be sure to start the prefix with a '/' (i.e. */jenkins*).

jenkins_http_port: 8080
> Port for accessing the Jenkins web interface.

jenkins_connection_delay: 5
jenkins_connection_retries: 60
> Set the number of tries, and the amount of time between each try, while attempting to connect to Jenkins after initial startup. Total time spent waiting on equals retries * delay, or if using the default values, 300 seconds.

jenkins_home: /var/lib/jenkins
> Set the path where artifacts, workspace, and plugins will be stored.

jenkins_jar_location: /opt/jenkins-cli.jar
> Path where *jenkins-cli.jar* will be kept.


Dependencies
------------

None.

License
-------

MIT/BSD

Author Information
------------------

[@awasilyev](https://github.com/awasilyev)

based on original [jenkins](https://github.com/geerlingguy/ansible-role-jenkins) role
