AEM Backup\Restore role
=========


## Summary


This role:
  - Make backup AEM instance with storage support such as AWS S3, Azure blob storage and SFTP




Role tasks
------------


- Run backup using CURl and put archive to directory
- (optional) Put archive in AWS S3 Bucket
- (optional) Put archive in Azure blob storage
- (optional) Put archive in SFTP


## Role Variables
--------------


You can override any variable below by setting "variable: value" in playbook.


- `aem_host`
AEM instance host. By default is 'http://localhost' ***without slash at the end (!)***
- `aem_port`
AEM instance port. By default is 4502
- `aem_username`
AEM instance username. By default is admin
- `aem_password`
AEM instance password. By default is admin
- `backup_path`
Where your backup will be placed. By default is /opt/aem/your_archive.zip
- `backup_name`
Name of your backup. By default is backup_year-month-day.zip

- `aws_s3_storage`
Use AWS S3 storage or not. By default is false.
- `aws_access_key`
Access key for access AWS resources through AWS CLI. ***Requirement if your specify aws_s3_storage as true (!)***
- `aws_secret_access_key`
Secret access key for access AWS resources through AWS CLI. ***Requirement if your specify aws_s3_storage as true (!)***
- `aws_s3_bucket`
Name of your S3 Bucket. ***Requirement if your specify aws_s3_storage as true (!)***
- `aws_s3_path`
Path inside your S3 Bucket. By default is /backups/archive.zip ***Requirement if your specify aws_s3_storage as true (!)***

- `azure_blob_storage`
Use Azure blob storage or not. By default is false.
- `azure_resource_group`
Resource group inside Azure. ***Requirement if your specify azure_blob_storage as true (!)***
- `azure_storage_account`
Azure storage account. ***Requirement if your specify azure_blob_storage as true (!)***
- `azure_container`
Azure container. ***Requirement if your specify azure_blob_storage as true (!)***

## Dependencies
------------


- ***When use azure_blob_storage, you must specify next environment variables (example below):***
    AZURE_SUBSCRIPTION_ID: 'xxxx'
    AZURE_CLIENT_ID: 'xxxx'
    AZURE_SECRET: 'xxxx'
    AZURE_TENANT: 'xxxx'


Example Playbook
----------------


#### #1 Backup example with AWS S3 storage
```yml
---
- name: Backup and restore feature
  hosts: aem_instance
  roles:
  - role: aem-backup-restore
  vars:
    aem_host: 'http://localhost'
    aws_s3_storage: true
    aws_s3_bucket: 'bucket'
    aws_s3_path: /backups/archive.zip
    aws_access_key: 'Sample'
    aws_secret_access_key: 'Sample'
```

### #2 Backup example with Azure blob storage
```yml
---
- name: Backup and restore feature
  hosts: aem_instance
  roles:
  - role: aem-backup-restore
  vars:
    aem_host: 'http://localhost'
    aws_s3_storage: false
    azure_blob_storage: true
    azure_resource_group: 'epm-ldi'
    azure_storage_account: 'storage_name'
    container: 'backups'
  environment:
    AZURE_SUBSCRIPTION_ID: 'xxxx'
    AZURE_CLIENT_ID: 'xxxx'
    AZURE_SECRET: 'xxxx'
    AZURE_TENANT: 'xxxx'
```

License
-------
Apache


Author Information
------------------


authors:
  - Lean Delivery Team <team@lean-delivery.com>