
## 1. Buckets and Objects

An S3 bucket is a container used to store data. The files stored inside a bucket are called objects.  
Each object includes:
- The file content
- Metadata
- Permissions
- A unique key (its name)
- An optional version ID if versioning is enabled

Buckets must have globally unique names across all AWS accounts.

---

## 2. Versioning

I learned that S3 versioning keeps multiple versions of a file.

Key points:
- When versioning is enabled, each update to a file creates a new version.
- Deleting a file does not remove it completely but adds a delete marker.
- The earlier versions remain available and can be restored.
- To restore a deleted file, enable "Show versions" and remove the delete marker.

Versioning is helpful for recovery from accidental deletions or overwrites.

---

## 3. Storage Classes

S3 supports multiple storage classes. The commonly used ones are:

- Standard: For frequently accessed data.
- Standard-IA (Infrequent Access): For data accessed less often.
- Glacier: Low-cost archival storage for long-term backups.

These classes differ in cost and performance.

---

## 4. Static Website Hosting

I learned how to host a static website using Amazon S3.

Steps:
1. Create a bucket.
2. Upload the website files such as `index.html` and `error.html`.
3. Enable "Static website hosting" in the bucket properties.
4. Disable "Block Public Access" to allow public access.
5. Add a bucket policy to allow public read access.

This provides a public website endpoint.

---

## 5. Syncing Local Folder with S3

Using the AWS CLI, I can sync my local folder with the S3 bucket:

```
aws s3 sync ./folder s3://bucket-name --delete
```

This command:
- Uploads new files
- Updates modified files
- Deletes files from S3 that are not present locally

It ensures the bucket matches the local folder. This is commonly used for deploying static websites.

---

## 6. Creating Buckets Using CLI

A bucket can also be created using the AWS CLI:

```
aws s3 mb s3://bucket-name
```

This is useful for automation or scripting tasks.

---

## Summary

What I learned today:
- Difference between buckets and objects
- Versioning and how to restore deleted files
- Storage classes and when to use them
- Hosting static websites on S3
- Syncing local folders using AWS CLI
- Creating buckets using CLI
