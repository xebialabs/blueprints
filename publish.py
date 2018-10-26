#!/usr/bin/python
import os
import re
import sys
import boto3

local_directory = './'
bucket = 'xl-cli'
destination = 'blueprints/'
excludes = r'^\..+'

# get S3 client using local credentials file & default profile
session = boto3.Session(profile_name='default')
s3_client = session.client('s3')

# enumerate local files recursively
for root, dirs, files in os.walk(local_directory):
    # exclude hidden dirs & files
    dirs[:] = [d for d in dirs if not re.match(r'\..*', d)]
    files = [f for f in files if not re.match(excludes, f)]

    for filename in files:
        # construct local & bucket paths
        local_path = os.path.join(root, filename)
        relative_path = os.path.relpath(local_path, local_directory)
        s3_path = os.path.join(destination, relative_path)

        # skip root files
        if local_path in ['./README.md', './publish.py']:
            continue

        print('\n>> Processing [%s] in S3 path "%s" & bucket: "%s"' % (local_path, s3_path, bucket))
        try:
            s3_client.head_object(Bucket=bucket, Key=s3_path)
            print("\tFile found on S3! Deleting...")
            try:
                s3_client.delete_object(Bucket=bucket, Key=s3_path)
            except:
                print("Unable to delete %s..." % s3_path)
        except:
            pass
        
        print("\tUploading...")
        s3_client.upload_file(local_path, bucket, s3_path)
