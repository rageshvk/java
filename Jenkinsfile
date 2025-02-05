pipeline{
    agent{
        label 'node1'
    }

    stages{
        stage('build'){
            steps{
                echo "this build stage"
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