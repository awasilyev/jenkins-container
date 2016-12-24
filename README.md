Jenkins CI
=========

[![Build Status](https://travis-ci.org/awasilyev/jenkins-container.svg?branch=master)](https://travis-ci.org/awasilyev/jenkins-container)

Use this role to add a jenkins ci/cd service to your Ansible Container project. See Role Variables below for how to set the jenkins hostname, plugins, admin credentials and java opts. You can pass additional jenkins options as command for this container. Connect to the jenkins on port 8080.

Run the following commands to install the service:

```
# Set the working directory to your Ansible Container project root
$ cd myproject

# Install the service
$ ansible-container install awasilyev.jenkins-container-role 
```

Role Variables
--------------

Set the following environment variables in container.yml:

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
