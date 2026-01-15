# PowerShell script to push code to GitHub
# Run this script from the project directory

$ErrorActionPreference = "Stop"

Write-Host "🚀 Starting GitHub push process..." -ForegroundColor Cyan

# Navigate to project directory
$projectPath = "c:\Users\colle\Downloads\catering_site_IHC (1)\catering_site_IHC"
Set-Location $projectPath

Write-Host "📁 Current directory: $(Get-Location)" -ForegroundColor Green

# Step 1: Configure Git
Write-Host "`n⚙️  Configuring Git..." -ForegroundColor Yellow
git config user.email "suraj.goni.sg@gmail.com"
git config user.name "surajgoni"

Write-Host "✅ Git configured:" -ForegroundColor Green
Write-Host "   Email: $(git config user.email)"
Write-Host "   Name: $(git config user.name)"

# Step 2: Check status
Write-Host "`n📊 Checking git status..." -ForegroundColor Yellow
git status

# Step 3: Stage all changes
Write-Host "`n📦 Staging all changes..." -ForegroundColor Yellow
git add .

# Step 4: Commit changes
Write-Host "`n💾 Committing changes..." -ForegroundColor Yellow
$commitMessage = "Add new event pages and images for Fort Lauderdale and Miami locations"
git commit -m $commitMessage

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Changes committed successfully!" -ForegroundColor Green
} else {
    Write-Host "⚠️  Commit may have failed or no changes to commit" -ForegroundColor Yellow
}

# Step 5: Push to GitHub using token
Write-Host "`n🚀 Pushing to GitHub..." -ForegroundColor Yellow
$token = "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"
$repoUrl = "https://github.com/surajgoni/catering_site_IHC.git"
$remoteUrl = "https://$token@github.com/surajgoni/catering_site_IHC.git"

# Set remote URL with token (temporarily)
git remote set-url origin $remoteUrl

# Push to main branch
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host "🌐 Repository: https://github.com/surajgoni/catering_site_IHC" -ForegroundColor Cyan
    
    # Reset remote URL to HTTPS (without token) for security
    git remote set-url origin $repoUrl
    Write-Host "`n🔒 Remote URL reset to HTTPS (token removed for security)" -ForegroundColor Yellow
} else {
    Write-Host "`n❌ Push failed. Please check the error messages above." -ForegroundColor Red
    Write-Host "💡 Tip: Make sure the token is valid and has 'repo' permissions." -ForegroundColor Yellow
}

Write-Host "`n✨ Done!" -ForegroundColor Cyan
