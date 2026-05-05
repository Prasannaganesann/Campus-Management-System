# Run these commands ONE BY ONE in PowerShell or Command Prompt
# Open terminal in VS Code with: Ctrl+` (backtick)

# Step 1 — Navigate to the project folder
cd "d:\LLM PROJECT"

# Step 2 — Initialize Git (skip if already done)
git init

# Step 3 — Set the remote origin
git remote add origin https://github.com/Prasannaganesann/Campus-Management-System.git

# Step 4 — Stage all files
git add .

# Step 5 — Commit
git commit -m "Initial commit: Campus Management System with AI features, HOD approval workflow, and multi-role access"

# Step 6 — Rename branch to main (GitHub default)
git branch -M main

# Step 7 — Push to GitHub
git push -u origin main
