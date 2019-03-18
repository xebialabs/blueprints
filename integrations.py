import glob
import os.path
import subprocess
import re
import sys

# Fetch latest xlwrapper

# Recursively scan for directories named '__test__'
blueprint_files = [filename for filename in glob.iglob('**/blueprint.yaml', recursive=True)]

regex = re.compile(r'/blueprint.yaml$')

for blueprint_file in blueprint_files:
    blueprint_dir = regex.sub('', blueprint_file)
    test_dir = '{}/__test__'.format(blueprint_dir)
    
    if os.path.exists(test_dir):
        test_files = [filename for filename in glob.iglob('{}/*'.format(test_dir))]
    
        for test_file in test_files:
            # print('will run xlw -b {} --answers {}'.format(blueprint_dir, test_file))
            result = subprocess.run(['./xlw', '-b', blueprint_dir, test_file], capture_output=True)
            if not result.returncode == 0:
                print('Test failed on {} with message "{}"'.format(test_file, result.stderr.decode('utf8').strip()))
                sys.exit(result.returncode)
