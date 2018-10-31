#!/usr/bin/python
import os
import re
import sys
import boto3
import hashlib

local_directory = './'
bucket_name = 'xl-cli'
destination = 'blueprints/'
excludes = r'^\..+'

# Calculate MD5 sum for local file
def md5_file(fname):
    hash_md5 = hashlib.md5()
    with open(fname, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()

# Calculate MD5 sum for S3 resource
def md5_s3(s3_client, bucket_name, resource_name):
    try:
        return s3_client.head_object(
            Bucket=bucket_name,
            Key=resource_name
        )['ETag'][1:-1]
    except Exception as e:
        print("Error getting MD5 from S3 resource %s" % resource_name)
        raise e

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

        print('>> Processing [%s] in S3 path "%s" & bucket: "%s"' % (local_path, s3_path, bucket_name))
        try:
            s3_client.head_object(Bucket=bucket_name, Key=s3_path)
            if md5_s3(s3_client, bucket_name, s3_path) != md5_file(local_path):
                print("\tFile has changed, deleting...")
                try:
                    s3_client.delete_object(Bucket=bucket_name, Key=s3_path)
                    print("\tUploading new version...")
                    s3_client.upload_file(local_path, bucket_name, s3_path)
                except:
                    print("\tUnable to delete %s" % s3_path)
            else:
                #print("\tFile is up-to-date")
                pass
        except:
            print("\tFile [%s] not found on S3, uploading.." % s3_path)
            s3_client.upload_file(local_path, bucket_name, s3_path)
