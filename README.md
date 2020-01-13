#1 Backup example with AWS S3 storage
---
- name: Backup and restore feature
  hosts: aem_instance
  roles:
  - role: aem-backup-restore
  vars:
    aem_host: 'http://localhost'
    aws_s3_storage: false
    aws_s3_bucket: 'bucket'
    aws_s3_path: /backups/archive.zip
    aws_access_key: 'Sample'
    aws_secret_access_key: 'Sample'
#2 Backup example with Azure blob storage
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