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