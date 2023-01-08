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

    stage('http-test') {
      steps {
        script {
          docker.image("borovensky/node_app:${env.BUILD_ID}").withRun('-p 49160:8090') {c ->
          sh "sleep 5; curl -i http://localhost:49160/wtf_Artem"
          }
        }

      }
    }

  }
}
