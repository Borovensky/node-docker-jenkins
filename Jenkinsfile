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

    stage('unit-test') {
      steps {
        script {
          docker.image("borovensky/node_app:${env.BUILD_ID}").inside {c ->
          sh 'npm run test'}
        }

      }
    }

  }
}