Android Studio
--------
Kill `adb`
```java
killall adb
adb kill-server
```
Start `adb`
```java
adb start-server
adb devices
```
Record Video
```
adb shell screenrecord /sdcard/video.mp4
```
Type into emulator
```
adb shell input text 'my string'
```

Github
--------
### Update default editor:

```java
git config --global core.editor emacs
git config --global core.editor /usr/local/bin/emacs
```

### See staged for commit changes
```java
git diff --cached origin/master
```
➜ git pull
There is no tracking information for the current branch. Please specify which branch you want to merge with.
```java
git branch --set-upstream-to=origin/<branch_name> <branch_name>
```
git against head
```java
git push origin HEAD:chore/collaborators_view --force
```
### Apply .gitignore to project
```java
git rm -r --cached .
git add .
git commit -m ".gitignore is now working"
```
### clean up remote branches
```java
git fetch --all --prune
```

### revert back to certain commit
```java
git reset 56e05fced 

# Moves pointer back to previous HEAD
git reset --soft HEAD@{1}

git commit -m "Revert to 56e05fced"

# Updates working copy to reflect the new commit
git reset --hard
```

### Move repo A to B
```java
cd B
git checkout master
git remote add A **url-of-repoA**
git fetch A
git merge A/master --allow-unrelated-histories
git push origin HEAD
git remote rm A
```

Bash
--------
Find application location:
```java
whereis java
type java
which java
command -v java
```

Update shell with bash profile:
```java
source ~/.bash_profile
```

Switch to another user
```java
su [account_name]
```

Show Hidden Files
```java
SUDO defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder
SUDO defaults write com.apple.Finder AppleShowAllFiles NO; killall Finder
```

Make file executable
```java
chmod +x fileName
```

Move PNGs recursively from one directory to another
```java
find ./dirA/ -type f -iname "*.png" -exec mv \{\} ~/dirB/ \;
```

Add prefixes to all files in a director
```java
for filename in *.png; do mv "$filename" "airline_$filename"; done;
```

Lower case files
```java
zip -0 -r foo.zip foo/*
unzip -LL foo.zip
```

Make Symbolic Link
```
ln -s [directory path] [name of symbolic link]
```

LS
```
ls -latr
  #all #last modified #reverse order
```

Sort
```
sort -u [file-name]
```

Uniq
```
uniq [file name]
```

Repair Permissions
```
sudo diskutil repairPermissions /
```

Remove sub directories	
```
rm -Rf [folder name]
```

curl
--------
download a file with headers:
```java
curl -H 'Accept: application/vnd.github.v3.raw' -H 'Accept: application/json' -O -L https://api.github.com/2016-10-15.json
```

Apple
--------
To turn Dashboard off:
```
defaults write com.apple.dashboard mcx-disabled -boolean YES 
```

To turn Dashboard on:
```
defaults write com.apple.dashboard mcx-disabled -boolean NO 
```

You have to restart the Dock after making either change for it to take effect:
```
killall Dock
```
Show Hidden Files
```
defaults write com.apple.finder AppleShowAllFiles TRUE
```
Restart Finder
```
killall Finder
```

Show Screensaver as background
```
/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background 
```

Reinstall Apple
```
Restart computer, Hold Apple+S

Then enter
/sbin/fsck -y [Enter]
/sbin/mount -uw / [Enter]
rm /var/db/.applesetupdone [Enter]
reboot [Enter]
```
Backup to HardDrive
```
Assuming the drives are /Volumes/Current and /Volumes/Backup, a 1 way backup of "Current" to "Backup" can be done by opening a terminal and typing the following:
 
Rsync -avz /Volumes/Current/ /Volumes/Backup/.
 
^ The "r" in "Rsync" above should be lowercase, I don't know why facebook insists on altering my response. In any case, it should work either way.
 
If you want to delete files on "Backup" that are no longer in "Current", throw in the —delete flag. Rsync uses a clever algorithm that only copies the differences between files (making sequential updates very fast) which is why it is preferred over a regular copy "cp" command here. Cp would copy the entire contents each time it is run.
 
If you want to automate this, you can use Apple's launch daemon or (simpler) a cron job (which, ironically, is actually managed by launchd on newer versions of OS X).
 
For example, if you wanted to run this command every morning at 5AM, you would open your crontab (using the command "crontab -e") and type the following:
 
0 5 * * * rsync -avz /Volumes/Current/ /Volumes/Backup/.
 
You will probably need administrator rights to edit the crontab, so type "su" at your terminal (it will prompt you for your admin password) before you attempt to edit the crontab.
 
For more information on rsync, you can open a terminal and type "man rsync" for its manual. For more information on cron/launchd, google is your friend.
```
Rar
```
./rar a -v[size]m [zip name] [folder/file to zip]
```

Django
-------

```
django-admin.py startproject 'mysite'
python manage.py startapp 'app'

python manage.py shell
python manage.py syncdb
python manage.py reset akhbaro
python manage.py runserver
django-admin.py makemessages --all
django-admin.py compilemessages

import pdb; pdb.set_trace() // debug in python

from tree import WordNode

python manage.py dumpdata > db
python manage.py loaddata db

from [project].models import * 
```
iOS
-------
Remove derived data
```
~/Library/Developer/Xcode/DerivedData/
rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache
```

Clean project
```
shift + cmd + k
shift + cmd + Alt + k 
```

Exit Debugger
```
repl
```

Print debugger variables
```
po [variable name]
```

Carthage
```
carthage update --platform iOS
carthage build --platform iOS
```

Pod
```
pod install
pod update
```

SVN
-------
```
svn import folder irl --message "inital imoport" --username [username] --password [password]
svn import ./MedicalMooz http://svn2.assembla.com/svn/medicalmooz --message "imoporting M1 app" --username seljabali@gmail.com --password
svn checkout http://svn2.assembla.com/svn/medicalmooz --username [username] --password [password]

ls -laF //See svn folders
svn status

svn add lawl.txt
svn commit

svn update

svn diff jabber.txt

svn resolved lawl.txt.
svn commit

revert

export //exports the branch without the svn meta data

delete
```

Images
------
- Convert webp to jpeg
```
dwebp file.webp -o abc.png
find ./ -name "*.jpg" -exec dwebp {} -o {}.png \;
```