import glob
import os.path
import subprocess
import re
import shutil
import sys

import yaml

# Fetch latest xlwrapper

regex = re.compile(r'/blueprint.ya?ml$')

# Recursively scan for directories named '__test__'
blueprint_files = []
for filename in glob.iglob('**/blueprint.y*ml', recursive=True):
    if regex.search(filename):
        blueprint_files.append(filename)

for blueprint_file in blueprint_files:
    blueprint_dir = regex.sub('', blueprint_file)
    test_dir = '{}/__test__'.format(blueprint_dir)

    if os.path.exists(test_dir):
        test_files = [filename for filename in glob.iglob('{}/test*.yaml'.format(test_dir))]
        if len(test_files) == 0:
            print('ERROR: No test files found under {}'.format(test_dir))
            # sys.exit(1)

        for test_file in test_files:
            print('Processing blueprint file {}'.format(blueprint_file))

            testdef = {}
            try:
                with open(test_file) as test_file_contents:
                    testdef = yaml.load(test_file_contents, Loader=yaml.Loader)
            except Exception as e:
                print(e)
            
            print(testdef)

            if 'answers-file' in testdef:
                answers_file = '{}/{}'.format(test_dir, testdef['answers-file'])
                if not os.path.exists(answers_file):
                    print('ERROR: Missing answers file {} for {}'.format(answers_file, test_dir))
                    sys.exit(1)

            if os.path.exists('temp'):
                shutil.rmtree('temp')
            os.mkdir('temp')
            os.chdir('temp')

            print('will run ../xlw -b ../{} --answers ../{}'.format(blueprint_dir, answers_file))
            result = subprocess.run(['../xlw', '-b', '../{}'.format(blueprint_dir), '--answers', '../{}'.format(answers_file)], capture_output=True)
            if not result.returncode == 0:
                print('ERROR: Test failed on {} with message "{}"'.format(answers_file, result.stderr.decode('utf8').strip()))
                sys.exit(result.returncode)
            else:
                if 'expected-files' in testdef:
                    print('Checking for expected files')
                    for expected_file in testdef['expected-files']:
                        if not os.path.exists(expected_file):
                            print('ERROR: Expected file {} not found'.format(expected_file))
                            sys.exit(1)

            os.chdir('..')
            shutil.rmtree('temp', ignore_errors=True)

    else:
        print('ERROR: No test found for blueprint {}'.format(blueprint_dir))
        # sys.exit(1)
