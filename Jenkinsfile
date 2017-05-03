pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                fastlane provision
            }
        }
        stage('Test') {
            steps {
                fastlane scan
            }
        }
        stage('Screenshots') {
            steps {
                fastlane screenshot
            }
        }
	stage('Deploy') {
            steps {
                fastlane build
		fastlane upload
            }
        }
    }
}
