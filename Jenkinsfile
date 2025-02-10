pipeline{
    agent{
        label 'node1'
    }
    tools{
        maven 'maven3'
        dockerTool 'docker'
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
                script{
                    docker.image('nginx').pull()
                    docker.image('nginx').run('-d -p 8090:80 --name web')
                }
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
                
                script{
                    dir('target/'){
                      stash name:'build-war',includes:'*.war'  
                    }
                    
                }
            }
        }
        stage('prod deploy'){
            when{expression{params.server=='prod'}}
            steps{
                sh """rm -rf stashed
                mkdir stashed
                """
                script{unstash 'build-war'
                sh 'mv *.war stashed/' 
                }
            }
        }
    }
}