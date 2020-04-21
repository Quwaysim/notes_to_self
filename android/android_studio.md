- Beef up memory:
  - Help->Edit Custom VM Options... <br>
  `-Xms4096m` <br>
  `-Xmx4096m` <br>
  `-XX:MaxPermSize=1024m` <br>
  `-XX:ReservedCodeCacheSize=200m` <br>
  `-XX:+UseCompressedOops` <br>

- Cut emulator CPU usage:
  - Go to `~/.android/avd/`
  - Go to device image folder
  - Edit `config.ini`
  - Set these properties:
     - `hw.audioInput=no`
     - `hw.audioOutput=no`

- Update LogCat color Scheme:
  - Download [color scheme.](https://github.com/seljabali/notes_to_self/blob/master/files/Darcula.icls)
  - Apply in `Preferences`->`Android LogCat`->`Scheme`->`Import Scheme`

- Add Coding Style
  - Move the coding style file to `~/Library/Preferences/AndroidStudio[version]/codestyles`
  - Android Studio->`Preferences`->`Editor`->`Code Style`, apply style
  
- Remove module still showing up
  - `[project]/.idea/gradle.xml` -- remove a module & related files from here.

### SVG <=> PNG Converter

- [Install ImageMagick](http://www.imagemagick.org/script/index.php)
- [Install Inkscape](https://inkscape.org/en/download/mac-os/) or `brew install caskformula/caskformula/inkscape`
- Download [generateAndroidDrawables.sh](https://gist.github.com/tntclaus/18f4fe7e8540f1cb283d2c7d8ad21d69)

- Run against SVG file for all Android sizes:
  - `./generateAndroidDrawables.sh someDrawable.svg 30`
- Run against SVG file for one single size:
  - `convert -density 1536 -background none -resize 20x20 someDrawable.svg someDrawable.png`

### Charles + Genymotion

- Genymotion emulator `Settings` => `Wifi`
- Press and hold your active network => `Modify Network`
- `Show Advanced Options` => `Proxy Settings` => `Manual`
- Set Proxy to: `10.0.3.2`
- Set Port to: `8888`
- Open genymotion browser & go `http://charlesproxy.com/getssl` & install certificate
