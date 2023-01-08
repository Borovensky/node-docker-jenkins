pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          checkout scm
          def customImage = docker.build("borovensky/node_app:${env.BUILD_ID}")
        }

      }
    }

  }
}