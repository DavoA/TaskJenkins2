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
                allOf {
                        expression { env.actionFlag == 'closed' }
                        expression { env.sourseBranchName == 'staging' }
                        expression { env.targetBranchName == 'main' }
                }
            }
            steps {
                  echo "Everething is good"
            }
        }
        stage('Building and Running Python Container') {
            steps {
                script {
                    docker.image('davidaris/python20code').run('-t', '--name=my-container')
                }
            }
        }
    }
}
