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


- `example`
Description of var



## Advanced config parameters:


- `example`
Description of var


## Dependencies
------------


- Without them


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