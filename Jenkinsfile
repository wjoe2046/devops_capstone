pipeline {
    agent any
    environment{
        DOCKER_TAG = getDockerTag()
    }
    stages{
        stage('Lint') {
            steps {
                sh "tidy -q -e index.html"
            }
        }

        stage('Build docker image'){
            steps{
                sh "docker build . -t wjoe2046/nodeapp:${DOCKER_TAG}"
            }
        }

        stage('Push to Dockerhub'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerpw')]) {
                    sh "docker login -u wjoe2046 -p ${dockerpw}"
                    sh "docker push wjoe2046/nodeapp:${DOCKER_TAG}"
                }
            }
        }
        stage('Deploy to K8s'){
            steps{
                sh "chmod +x changeTag.sh"
                sh "./changeTag.sh ${DOCKER_TAG}"
                sshagent(['kops-machine']) {
                    sh "scp -o StrictHostKeyChecking=no k8s-services.yml k8s-deployment-tagged.yml ubuntu@34.222.35.64:/home/ubuntu"
                    script{
                        try{
                            sh "ssh ubuntu@34.222.35.64 kubectl apply -f k8s-deployment-tagged.yml"
                            sh "ssh ubuntu@34.222.35.64 kubectl apply -f k8s-services.yml"
                            sh "ssh ubuntu@34.222.35.64 docker run -d -p 8080:8080 --name=nodeapp wjoe2046/nodeapp:${DOCKER_TAG}"	
                        } catch(error){
                            sh "ssh ubuntu@34.222.35.64 kubectl create -f . "
                            
                        }
                    }
                }
            }
        }
    }
    
}

def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
