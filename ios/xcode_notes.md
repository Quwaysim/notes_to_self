### Finding files on Simulator
- `/Users/<username>/Library/Developer/CoreSimulator/Devices/<simulator-uuid>/data/Containers/Data/Application/<application-uuid>/Documents/`

### Finding files on Device
- Once your device is connected open `Xcode` > `Window` > `Devices and Simulators` > `Devices`. Choose your desired device.
- Navigate to the downloaded app on in the `Installed App` section. With the correct app highlighted, select the gear icon underneath and choose `Download Container`
- Navigate to the path you chose to download to. The file will be a xcappdata bundle. Right click and select `Show Package Contents`. The Realm files are located under `/AppData/Documents`.
