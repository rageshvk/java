pipeline{
    agent {
        label 'node1'
    }
    tools{
        maven 'maven'
    }
    parameters {
        choice choices: ['dev-node1', 'prod'], name: 'select-env'
    }
    environment{
        NAME='amal'
    }
    
    stages{
        stage('build'){
            steps{
                sh 'mvn clean package'
                echo "hello $NAME and value is ${params.val}"
            }
            post{
                success{
                    archiveArtifacts artifacts: "**/target/*.war"
                }
            }
        }
        stage('test'){
            parallel{
                stage('testA'){
                    steps{
                        echo "this is stage A"
                    }
                }
                stage('testB'){
                    steps{
                        echo "this is stage B"
                    }
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
