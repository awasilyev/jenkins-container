#!/bin/sh
JENKINS_HOME="/var/lib/jenkins"
JENKINS_WAR="/usr/lib/jenkins/jenkins.war"

cat >${JENKINS_HOME}/init.groovy.d/basic-security.groovy <<EOT 
#!groovy
import hudson.security.*
import jenkins.model.*

def instance = Jenkins.getInstance()

println "--> Checking if security has been set already"

if (!instance.isUseSecurity()) {
    println "--> creating local user ${JENKINS_ADMIN_USERNAME}"

    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount('${JENKINS_ADMIN_USERNAME}', '${JENKINS_ADMIN_PASSWORD}')
    instance.setSecurityRealm(hudsonRealm)

    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)
    instance.save()
}
EOT


candidates="
/etc/alternatives/java
/usr/lib/jvm/java-1.6.0/bin/java
/usr/lib/jvm/jre-1.6.0/bin/java
/usr/lib/jvm/java-1.7.0/bin/java
/usr/lib/jvm/jre-1.7.0/bin/java
/usr/lib/jvm/java-1.8.0/bin/java
/usr/lib/jvm/jre-1.8.0/bin/java
/usr/bin/java
"
for candidate in $candidates
do
  [ -x "$JENKINS_JAVA_CMD" ] && break
  JENKINS_JAVA_CMD="$candidate"
done

JAVA_CMD="$JENKINS_JAVA_CMD $JENKINS_JAVA_OPTIONS -DJENKINS_HOME=$JENKINS_HOME -jar $JENKINS_WAR"
PARAMS="-webroot=/var/cache/jenkins/war"

exec $JAVA_CMD $PARAMS $*
