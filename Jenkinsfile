pipeline {

  environment {
    dockerimagename = "shashikanthmartha/nodeapp"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/shashikanthmartha/nodeapp_test.git'
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

    stage('Deploying App to Kubernetes') {
       steps {
         script {
             sh ('aws eks update-kubeconfig --name demo-cluster --region ap-south-1')
             sh "kubectl get ns"
             sh "kubectl apply -f deploymentservice.yml"
          // kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
         }
       }
     }

  }

}
