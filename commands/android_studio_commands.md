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