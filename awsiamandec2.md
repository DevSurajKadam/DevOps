



## 1. IAM (Identity and Access Management)

IAM is used to manage who can access AWS services and what actions they can perform.

### What I Learned

- In IAM, we create users and attach policies to define which services or actions the user is allowed to access.
- Policies act as permission documents and can be AWS-managed or custom JSON-based.
- Instead of adding policies to each user individually, we can create a group, attach policies to that group, and then add users to the group. All users inherit the group permissions.
- While creating a user, we can provide:
  - Console access (for AWS web console login)
  - Programmatic access (generates an Access Key ID and Secret Access Key for CLI usage)

### Access Keys and AWS CLI

When programmatic access is enabled, AWS generates:
- Access Key ID
- Secret Access Key

These are used for the AWS CLI setup:

```
aws configure
```

During configuration, we enter the access key, secret key, region, and output format. This allows the IAM user to use AWS services from the terminal.

### IAM Roles

- IAM Roles are used to provide permissions to AWS services instead of users.
- Example: EC2 instances can use an IAM role with S3 read-only permissions to access S3 without storing credentials inside the instance.
- Roles follow the principle of temporary credentials and are more secure.

---

## 2. EC2 (Elastic Compute Cloud)

EC2 provides virtual machines in the AWS cloud.

### What I Learned

When launching an EC2 instance, we configure:

- AMI (Amazon Machine Image), for example Amazon Linux 2
- Instance type, such as t2.micro
- Key pair (.pem file), used for SSH login
- Security group, which acts as a firewall
- Default VPC (Virtual Private Cloud), where the instance will run
- Optional IAM role (attached to EC2) to give permissions

### Security Groups

Security groups define inbound and outbound traffic rules.

Common inbound rule examples:
- Port 22 for SSH
- Port 80 for HTTP
- Port 443 for HTTPS

Outbound rules usually allow all traffic by default.

### SSH Access to EC2

Steps for connecting to an EC2 instance:

1. Download the .pem file when creating the instance.
2. Change its permissions:
   ```
   chmod 400 my-key.pem
   ```
3. Connect to the instance:
   ```
   ssh -i my-key.pem ec2-user@<public-ip>
   ```

This securely logs into the EC2 instance using the private key.

### Clarification

The IAM user's access key and secret key are not used for SSH access.  
They are used for AWS CLI.  
SSH access is always through the .pem key pair created at EC2 launch time.

---

## 3. Using AWS CLI for EC2

After configuring AWS CLI, I can manage EC2 instances through terminal commands.

Some helpful commands:

List instances:
```
aws ec2 describe-instances
```

Start or stop an instance:
```
aws ec2 start-instances --instance-ids <instance-id>
aws ec2 stop-instances --instance-ids <instance-id>
```

Launch an instance (example):
```
aws ec2 run-instances   --image-id ami-0abcdef1234567890   --count 1   --instance-type t2.micro   --key-name my-keypair   --security-group-ids sg-0123456789abcdef0
```

---

## Quick Recap

- IAM users and groups help manage permissions.
- Policies define allowed or restricted actions.
- IAM roles give permissions to AWS services like EC2.
- EC2 allows launching virtual machines using AMI, instance type, key pair, and security groups.
- SSH access requires the .pem private key, not the access key/secret key.
- AWS CLI allows programmatic management of EC2 resources.

---

## What I Learn Today

- Created IAM users, groups, and roles.
- Attached policies and understood permission boundaries.
- Created an EC2 instance and connected to it using SSH.
- Configured security groups to allow specific traffic.
- Used AWS CLI to interact with EC2 resources.
- Learned the difference between IAM authentication and EC2 SSH access.


