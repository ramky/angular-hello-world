// node {
//   def commit_id
//   stage('Preparation'){
//     checkout scm
//     sh "git rev-parse --short HEAD > .git/commit-id"
//     commit_id = readFile('.git/commit').trim()
//   }

//   stage('test') {
//     nodejs(nodeJsInstallationName: 'nodejs'){
//       sh 'npm install'
//       sh 'npm test'
//     }
//   }

//   stage('docker build/push') {

//   }
// }

// node {
//     def app

//     stage('Clone repository') {

//         checkout scm
//     }

//     stage('Build image') {

//         app = docker.build("ramky/angular-nginx-docker")
//     }

//     stage('Test image') {

//         app.inside {
//             sh 'echo "Tests passed"'
//         }
//     }

//     stage('Push image') {
//         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
//             app.push("${env.BUILD_NUMBER}")
//             app.push("latest")
//         }
//     }
// }

pipeline {
  environment {
    registry = "ramky/angular-nginx-docker"
    registryCredential = 'docker-hub-credentials'
  }
  agent any

  stages {
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}