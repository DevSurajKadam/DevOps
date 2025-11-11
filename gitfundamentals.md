

##  Cloning a Repository

To start working on an existing project, I cloned the repo from GitHub onto my local machine.

```bash
git clone <repo-url>
```

Example:
```bash
git clone https://github.com/DevSurajKadam/DevOps.git
```

This command creates a local copy of the remote repository.

---

##  Pulling Latest Code

Before starting any new work, I make sure my local branch is up-to-date with the latest changes.

```bash
git pull origin <branch-name>
```

Example:
```bash
git pull origin main
```

This fetches and merges the latest commits from the remote branch into my local branch.

---

## Switching Between Branches

To move between branches:

```bash
git checkout <branch-name>
```

Example:
```bash
git checkout main
```

This switches me to the specified branch.

---

##  Creating a New Branch

To create a new branch and immediately switch into it:

```bash
git checkout -b <new-branch-name>
```

Example:
```bash
git checkout -b feature/update-git-notes
```

 This creates a new branch for my changes — a best practice before editing any files.

---

##  Checking the Current Status

To see which files have been changed, added, or deleted:

```bash
git status
```

This helps me review pending changes before staging or committing.

---

##  Connecting Terminal to GitHub Using SSH

Instead of entering username/password every time (for HTTPS), I connected my local machine to GitHub securely via **SSH keys**.

### Step 1: Install Git and Verify
```bash
git --version
```
Confirms Git is installed correctly.

---

###  Step 2: Generate an SSH Key
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
This creates a public/private SSH key pair in `~/.ssh/`.

---

###  Step 3: Add the SSH Key to GitHub
1. Copy your public key:
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
2. Go to **GitHub → Settings → SSH and GPG keys → New SSH key**
3. Paste the key and save.

---

### Step 4: Point the Repo to Use SSH Instead of HTTPS
```bash
git remote set-url origin git@github.com:DevSurajKadam/DevOps.git
```

This updates the remote URL so all future operations use SSH authentication.

---

## Quick Recap

| Command | Purpose |
|----------|----------|
| `git clone <url>` | Clone repository to local machine |
| `git pull origin <branch>` | Pull latest code from branch |
| `git checkout <branch>` | Switch branches |
| `git checkout -b <new-branch>` | Create & switch to new branch |
| `git status` | Check modified/untracked files |
| `ssh-keygen -t ed25519 -C` | Generate SSH key for secure Git auth |
| `git remote set-url origin git@github.com:...` | Point repo to SSH remote |

---



