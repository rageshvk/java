pipeline{
    agent{
        label 'node1'
    }
    tools{
        maven 'maven3'
    }
    environment{
        name="amalk"
    }
    stages{
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
            post{
                success{
                    archiveArtifacts artifacts: "target/*.war"
                }
            }
        }

        stage('test'){
            parallel{
                stage('test A'){
                    steps{
                       echo "this is test A $name"  
                    }
                   
                }
                stage('test B'){
                    steps{
                      echo "this is test B"  
                    }
                    
                }
            }
        }
        stage('deploy'){
            steps{
                echo "this is deploy" 
            }
        }
    }
}