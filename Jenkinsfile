pipeline {

  environment {
    dockerimagename = "guruprakash8/nodeapp"
    dockerImage = ""
  }

  agent docker

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/guru-budati/Jenkins-integration-with-kubernetes'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhublogin'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }

    // stage('Deploying App to Kubernetes') {
    //   steps {
    //     script {
    //       kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
    //     }
    //   }
    // }

  }

}
