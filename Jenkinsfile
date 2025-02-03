pipeline{
    agent {
        label 'node1'
    }
    tools{
        maven 'maven'
    }
    stages{
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
            post{
                success{
                    archiveArtifacts artifacts: "**/target/*.war"
                }
            }
        }

        stage(deploy){
            steps{
                sh """
                sudo docker run -d --name tomcal -p 8090:8080  tomcat
                sudo docker cp $WORKSPACE/demo/target/*.war tomcat:/usr/local/tomcat/webapps"""
            }
        }

    }
}
