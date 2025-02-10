pipeline{
    agent{
        label 'node1'
    }
    tools{
        maven 'maven3'
    }
    parameters {
        choice choices: ['dev', 'prod'], name: 'server'
    }
    environment{
        name="amalk"
    }

    stages{
        stage('build'){
            steps{
                sh 'mvn clean package -DskipTests=True'
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
                sh "mvn test"
                dir('target/')
                {
                    stash name:'build-war',includes:'*.war'
                }
            }
        }
        stage('prod deploy'){
            when{expression{params.server=='prod'}}
            steps{
                sh """rm -rf stashed
                mkdir stashed"""
                unstash 'build-war'
                sh 'mv *.war stashed/' 
                sh 'pwd'
            }
        }
    }
}