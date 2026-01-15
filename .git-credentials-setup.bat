@echo off
cd /d "c:\Users\colle\Downloads\catering_site_IHC (1)\catering_site_IHC"

echo Configuring Git...
git config user.email "suraj.goni.sg@gmail.com"
git config user.name "surajgoni"

echo.
echo Staging all changes...
git add .

echo.
echo Committing changes...
git commit -m "Add new event pages and images for Fort Lauderdale and Miami locations"

echo.
echo Pushing to GitHub...
git push https://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@github.com/surajgoni/catering_site_IHC.git main

echo.
echo Done!
