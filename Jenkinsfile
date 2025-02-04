pipeline{
    agent {
        label 'node1'
    }
    tools{
        maven 'maven'
    }
    environment{
        NAME='amal'
    }
    stages{
        stage('build'){
            steps{
                sh 'mvn clean package'
                echo "hello $NAME"
            }
            post{
                success{
                    archiveArtifacts artifacts: "**/target/*.war"
                }
            }
        }

        // stage(deploy){
        //     steps{
        //         sh """
        //         sudo docker run -d --name tomcat -p 8090:8080  tomcat
        //         sudo docker cp $WORKSPACE/target/*.war tomcat:/usr/local/tomcat/webapps"""
        //     }
        // }

    }
}
