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
        stage(test)
    }
}
