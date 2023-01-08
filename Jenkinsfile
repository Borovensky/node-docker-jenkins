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

    stage('Publish') {
      steps {
        script {
          docker.withRegistry('', 'dockerhub_id'){
            docker.image("borovensky/node_app:${env.BUILD_ID}").push('latest')
            docker.image("borovensky/node_app:${env.BUILD_ID}").push("${env.BUILD_ID}")
          }
        }

      }
    }

    stage('Deploy') {
      steps {
        sh 'docker stop node_app || true; docker rm node_app || true; docker run -d --name node_app -p 49160:8090 borovensky/node_app:latest'
      }
    }

    stage('Validation') {
      steps {
        sh 'curl http://localhost:8090/test_string'
      }
    }

  }
}
