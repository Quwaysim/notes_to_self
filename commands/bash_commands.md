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

download a file with headers:
```java
curl -H 'Accept: application/vnd.github.v3.raw' -H 'Accept: application/json' -O -L https://api.github.com/2016-10-15.json
```

- Convert webp to jpeg
```
dwebp file.webp -o abc.png
find ./ -name "*.jpg" -exec dwebp {} -o {}.png \;
```