pipeline {
  agent any
  stages {
    stage('source') {
      steps {
        echo 'source checkout'
        git(url: 'https://github.com/uugdev/jenkins.git', branch: 'main')
      }
    }

    stage('build') {
      steps {
        withGradle() {
          tool(name: 'Maven', type: 'buildtool')
        }

      }
    }

    stage('deploy') {
      steps {
        sh 'echo "deploy success"'
      }
    }

  }
}