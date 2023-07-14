node {
  stage('SCM') {
    checkout([$class: 'GitSCM', branches: [[name: '*/beta']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg:  [], \
    userRemoteConfigs: [[credentialsId: 'admingithub', url: 'git@github.com:Gemini-Solutions/ATS_API_Automation.git', poll: 'false']]])
  }
}
node('maven_runner_java11')
{
    stage('Maven_Build')
    {
      container('maven-runner-11') {
            dir('rpasrer_testing') {
                sh 'rm -rf target'
                sh 'mvn clean test'
            }
        }
    }
}
