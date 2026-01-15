#!/bin/bash
# Script to push code to GitHub
# Run this script from the project directory after Xcode Command Line Tools are installed

echo "🚀 Starting GitHub push process..."

# Navigate to project directory
cd "$(dirname "$0")"
echo "📁 Current directory: $(pwd)"

# Step 1: Configure Git
echo ""
echo "⚙️  Configuring Git..."
git config user.email "suraj.goni.sg@gmail.com"
git config user.name "surajgoni"

echo "✅ Git configured:"
echo "   Email: $(git config user.email)"
echo "   Name: $(git config user.name)"

# Step 2: Initialize repository if needed
if [ ! -d .git ]; then
    echo ""
    echo "📦 Initializing git repository..."
    git init
fi

# Step 3: Check status
echo ""
echo "📊 Checking git status..."
git status

# Step 4: Stage all changes
echo ""
echo "📦 Staging all changes..."
git add .

# Step 5: Commit changes
echo ""
echo "💾 Committing changes..."
git commit -m "Update phone number to (754) 200-4891"

if [ $? -eq 0 ]; then
    echo "✅ Changes committed successfully!"
else
    echo "⚠️  Commit may have failed or no changes to commit"
fi

# Step 6: Set up remote
echo ""
echo "🔗 Setting up remote repository..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/surajgoni/catering_site_IHC.git

# Step 7: Set branch to main
git branch -M main

# Step 8: Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
echo "⚠️  Note: You may be prompted for GitHub credentials"
echo "   If you have 2FA enabled, use a Personal Access Token as your password"
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo "🌐 Repository: https://github.com/surajgoni/catering_site_IHC"
else
    echo ""
    echo "❌ Push failed. Please check the error messages above."
    echo "💡 Tip: You may need to authenticate with GitHub"
    echo "   - Use your GitHub username"
    echo "   - Use a Personal Access Token (not your password) if you have 2FA enabled"
    echo "   - Create a token at: https://github.com/settings/tokens"
fi

echo ""
echo "✨ Done!"
