pipeline {
    agent any
    triggers {
        GenericTrigger(
            genericVariables: [
                [key: 'targetBranchName', value: '$.pull_request.base.ref'],
                [key: 'sourseBranchName', value: '$.pull_request.head.ref'],
                [key: 'actionFlag', value: '$.action'],
            ],
            token: 'test'
        )
    }
    stages {
        stage('Check branch name') {
            when {
                not {
                    allOf {
                        expression { env.actionFlag != 'closed' }
                        expression { env.sourseBranchName != 'staging' }
                        expression { env.targetBranchName != 'main' }
                    }
                }
            }
            steps {
              error "Something is wrong"
            }
        }
        stage('Building and Running Python Container') {
            agent {
                docker {
                    image 'davidaris/python20code'
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                container(name: 'my_container', rm: true) {
                    //
                }
                echo "Finished"
            }
        }
    }
}
