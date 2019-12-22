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