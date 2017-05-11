node ('osx') {
    env.PATH = "/usr/local/bin:${env.PATH}"
    env.FASTLANE_DONT_STORE_PASSWORD=1
    // set locale for screenshots
    env.LC_CTYPE = "en_US.UTF-8"
    ansiColor('xterm') {
        withCredentials([string(credentialsId: 'FASTLANE_USER', variable: 'FASTLANE_USER'),
                     string(credentialsId: 'FASTLANE_PASSWORD', variable: 'FASTLANE_PASSWORD'),
                     string(credentialsId: 'MATCH_PASSWORD', variable: 'MATCH_PASSWORD'),
                     string(credentialsId: 'TIMECAR_PASSWORD', variable: 'TIMECAR_PASSWORD')
            ]) {
            stage('Preparation') { // for display purposes
                // Get some code from a GitHub repository
                git credentialsId: '406214e1-4f8f-4ca1-8a6d-d3ac8b1d8787', url: 'http://mmccabe@45.32.89.1:9090/timecar/timecar-poker.git'
                sh "env"
                //sh "ssh-agent bash -c 'ssh-add /Users/jenkins/.ssh/id_rsa'"
                sh "fastlane certificates"
            }
            stage('Test') {
                sh "security -v unlock-keychain -p '$TIMECAR_PASSWORD' '/Users/jenkins/Library/Keychains/login.keychain-db'"
                sh "fastlane test"
            }
            stage('Screenshot') {
                sh "fastlane screenshot"
            }
            stage('Results') {
                sh "security -v unlock-keychain -p '$TIMECAR_PASSWORD' '/Users/jenkins/Library/Keychains/login.keychain-db'"
                sh "fastlane build"
                archive 'TimeCar Poker.ipa'
            }
        }
    }
}
