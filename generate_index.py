#!/usr/bin/python
import os
import json

local_directory = './'
output_file = 'index.json'
bluprint_def_files = {'blueprint.yaml', 'blueprint.yml'}
blueprint_dirs = []

# enumerate local directories recursively
for current_dir, dirs, files in os.walk(local_directory):
    files = set([f.lower() for f in files])

    # extract root blueprint directories
    if (len(set(files) & bluprint_def_files) > 0) and './fragments/' not in current_dir:
        blueprint_dirs.append(current_dir[2:])

blueprint_dirs.sort()
print('>> Found blueprint directories: %s' % (blueprint_dirs))

# output resulting list to file
with open(output_file, 'w') as f:
    json.dump(blueprint_dirs, f, indent=2, separators=(',', ': '), sort_keys=True)
    f.write('\n')  # add trailing newline for POSIX compatibility
    print('>> Results written to file "%s"\n' % (output_file))
