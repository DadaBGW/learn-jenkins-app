pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    ls -la
                    node --version
                    npm --version
                    npm ci
                    npm run build
                    ls -la
                '''
            }
        }
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
    }
}
