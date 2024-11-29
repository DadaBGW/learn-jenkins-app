pipeline {
    agent any

    stages {
        //Comment
        /*
        multiline comment
        */
//         stage('Build') {
//             agent {
//                 docker {
//                     image 'node:18-alpine'
//                     reuseNode true
//                 }
//             }
//             steps {
//                 sh '''
//                     ls -la
//                     node --version
//                     npm --version
//                     npm ci
//                     npm run build
//                     ls -la
//                 '''
//             }
//         }
        stage('Test') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                echo "Test stage"
                sh """
                (ls ./build/index.html >> /dev/null 2>&1 && echo 'index.html' file exist!) || echo 'index.html' file DOES NOT EXIST!
                npm test
                """
            }
        }

        stage('E2E') {
                    agent {
                        docker {
                            image 'mcr.microsoft.com/playwright:v1.49.0-noble'
                            reuseNode true
                        }
                    }
                    steps {
                        echo "Test stage"
                        sh """
                            npm install serve
                            node_modules/.bin/serve -s build
                            npx playwright test
                        """
                    }
                }
    }

    post {
        always {
            junit 'test-results/junit.xml'
        }
    }

}
