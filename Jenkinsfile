#!groovy

pipeline {
    agent none

    options {
        buildDiscarder(logRotator(numToKeepStr: '20', artifactDaysToKeepStr: '7', artifactNumToKeepStr: '5'))
        timeout(time: 1, unit: 'HOURS')
        timestamps()
        ansiColor('xterm')
    }

    stages {
        stage('Push Blueprints to Dist server') {
            agent {
                node {
                    label 'xld||xlr'
                }
            }

            steps {
                checkout scm
                sh "rsync -razv --delete --chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r --exclude '.*' --exclude 'Jenkinsfile' --exclude 'publish.py' --exclude 'README.md' . ${env.DIST_SERVER_USER}@${env.DIST_SERVER_HOSTNAME}:${env.DIST_SERVER_BLUEPRINT_PATH}"

            }
        }
    }
}