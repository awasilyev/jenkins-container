[![Build Status](https://travis-ci.org/awasilyev/jenkins-container.svg?branch=master)](https://travis-ci.org/awasilyev/jenkins-container)

# Jenkins CI

Use this role to add a jenkins CI/CD service to your Ansible Container project.

Run the following to install the service:

```
# Set the working directory to your Ansible Container project root
$ cd myproject

# Install the service
$ ansible-container install awasilyev.jenkins-container
```

## Post Installation

### Connecting 

In `container.yml` the Jenkins server port is mapped to host port **8080**. If you're using Docker Engine or Docker for Mac to run the service, connect to the web console at [http://localhost:8080](http://localhost:8080).

### Persisting data

Jenkins data, plugins, artifacts, etc. are written to */var/lib/jenkins*. During container runtime, if you want to persist this data, add a *volume* directive to `container.yml` that maps a host path or named volume to this path. 

### Configuring

On startup the *jenkins* container executes */usr/bin/startup_jenkins.sh* to install plugins, and launch the Jenkins process. Any parameters passed to this script via the *command* directive in `container.yml` will be appended to the `java` command used to launch Jenkins. View [start_jenkins.sh.j2](./templates/start_jenkins.sh.j2) for a look at the template used to create this script during image build.

See Environment Variables, and Role Variables below for details on setting the admin credentials, installing plugins, passing additional Java options, and determining the Jenkins version to install. 

## Environment Variables

The following variables are defined in `container.yml`, and set as environment variables in the *jenkins* container:

JENKINS_ADMIN_USERNAME: admin
> Set the username for jenkins admin user.

JENKINS_ADMIN_PASSWORD: admin
> Set the password for jenkins admin user.

JENKINS_JAVA_OPTIONS: ""
> Provide additional options to the `java` command used to launch Jenkins in the container startup script, */start_jenkins.sh*.

JENKINS_PLUGINS: ""
> Provide a comma-separated list of plugins.


## Role Variables

jenkins_version: latest 
> Set to a specific version of Jenkins to install during image build, or 'latest' to install the latest version. 

jenkins_dependencies: []
> List of packages to be installed during image build. The list in [defaults/main.yml](./defaults/main.yml), will be added to the project `main.yml` when the role installed. Add any additional packages that may be required by any plugins you plan to install. For example, if you plan to install the *git* plugin, it depends on the *git* package being installed.

## Dependencies

None.

## License

MIT/BSD

## Author Information

[@awasilyev](https://github.com/awasilyev)

based on original [jenkins](https://github.com/geerlingguy/ansible-role-jenkins) role
