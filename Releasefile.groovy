// Exported from:        https://xl-release.xebialabs.com/#/templates/Folder4eb254f507564303b486953cfde27482-Releasee11b1a9b619a4ca39114b51900a91987/releasefile
// XL Release version:   8.6.3
// Date created:         Fri Jun 07 15:09:04 CEST 2019
// Needs to be zipped in order to import back into XLR

xlr {
  template('Blueprints release template') {
    folder('Cloud Love')
    variables {
      stringVariable('BLUEPRINTS_VERSION') {
        label 'Blueprints Version'
        description 'The release version to use, should be x.x.x notation'
      }
      stringVariable('GIT_BRANCH') {
        label 'Git branch'
        description 'Git branch to build'
        value 'master'
      }
    }
    description 'XLR pipeline to release blueprints every milestone'
    scheduledStartDate Date.parse("yyyy-MM-dd'T'HH:mm:ssZ", '2019-04-08T09:00:00+0200')
    phases {
      phase('Verification') {
        tasks {
          script('Verify Travis CI last build') {
            script (['''\
import urllib2
import json
import time
travis_url = 'https://api.travis-ci.org/repos/xebialabs/blueprints/branches/${GIT_BRANCH}'
headers = {"User-Agent":"XebiaLabs", "Accept": "application/vnd.travis-ci.2.1+json" }
def make_req(url, body=None, token=None):
  req = urllib2.Request(url, None, headers=headers)
  opener = urllib2.build_opener()
  response = opener.open(req)
  return json.loads(response.read())
resp = make_req(travis_url)
branch = resp['branch']
print("\\nLast build #: " + branch['number'])
print("\\nLast build status: " + branch['state'])
if branch['state'] != "passed":
  print("\\nCheck the logs on: https://travis-ci.org/xebialabs/blueprints/builds/" + repo['id'] + "\\n")
  print(json.dumps(resp, indent=4, sort_keys=True))
  exit(1)
'''])
          }
        }
      }
      phase('Prepare') {
        color '#0099CC'
        tasks {
          custom('Create Branch for release') {
            script {
              type 'github.CreateBranch'
              server 'XebiaLabs GitHub (from community GitHub plugin)'
              organization 'xebialabs'
              repositoryName 'blueprints'
              oldBranch '${GIT_BRANCH}'
              newBranch '${BLUEPRINTS_VERSION}-maintenance'
            }
          }
        }
      }
      phase('Release') {
        color '#0099CC'
        tasks {
          custom('Release new version of Blueprints') {
            script {
              type 'jenkins.Build'
              jenkinsServer 'Jenkins NG'
              jobName 'XL Devops As Code/job/Blueprints Release'
              jobParameters 'RELEASE_BRANCH_NAME=${BLUEPRINTS_VERSION}-maintenance\n' +
              'RELEASE_FOLDER=${BLUEPRINTS_VERSION}'
            }
          }
          custom('Notify team') {
            script {
              type 'slack.Notification'
              server 'Cloud-Love'
              title 'Blueprints version  ${BLUEPRINTS_VERSION} released'
              message 'Blueprints version ${BLUEPRINTS_VERSION} was released to https://dist.xebialabs.com/public/blueprints/${BLUEPRINTS_VERSION} and a new branch ${BLUEPRINTS_VERSION}-maintenance has been created in GitHub.'
              titleLink 'https://dist.xebialabs.com/public/blueprints/${BLUEPRINTS_VERSION}'
              color 'good'
            }
          }
        }
      }
    }
    
  }
}
