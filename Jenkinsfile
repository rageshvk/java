pipeline{
    agent{
        label 'node1'
    }
    tools{
        maven 'maven3'
    }
    stages{
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }

        stage('test'){
            steps{
                echo "this is test" 
            }
        }
        stage('deploy'){
            steps{
                echo "this is deploy" 
            }
        }
    }
}