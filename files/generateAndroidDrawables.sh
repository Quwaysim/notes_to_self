#!/bin/sh
# Example usage:
# ./generateAndroidDrawables.sh my_image.png 140 /absolute/path/to/android/res/drawables
#
# Will generate 140dp android drawables for 6 DPI on out/my_image.png/ directory. 
# Be sure your original image has sustainable resolution for xxxhdpi drawable, 
# which is 140 x 4 PX in case of this example.
#
# Requires ImageMagic
# SVG conversion recommended to be done with Inkscape:
# https://inkscape.org/en/



IMAGE=$(basename "$1")
IMAGENAME="${IMAGE%.*}"
IMAGEEXT="${IMAGE##*.}"
DPSIZE=$2

if [ ! -d "$3" ] ; then
    ASSETDIR="out/${IMAGENAME}/drawable-"
    echo "Directory '$3' not exists. Using ${ASSETDIR}<\*dpi> for image output"
else 
    ASSETDIR="$3/drawable-"
fi 


OSX_INKSCAPE_PATH="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"

USE_INKSCAPE=0
INKSCAPE_PATH=""

if [ $IMAGEEXT == "svg" ] ; then
  unamestr="$(uname)"
  if [[ "$unamestr" == 'Darwin' ]]; then
     INKSCAPE_PATH=$OSX_INKSCAPE_PATH
  else
     INKSCAPE_PATH=$(which inkscape)
  fi

  if [ ! -x "$INKSCAPE_PATH" ] ; then
     echo "\x1B[93mWARNING:\x1B[39m Inkskape is not in PATH"
  else
     USE_INKSCAPE=1
  fi
fi

if [ ! -x "$(which convert)" ] ; then
   echo "\x1B[1;31mERROR:\x1B[39m ImageMagic convert is not in PATH while required for this script"   
   exit 2
fi


SIZE_ldpi=`echo "$DPSIZE * 0.75" | bc -l`
SIZE_mdpi=$DPSIZE
SIZE_hdpi=`echo "$DPSIZE * 1.5" | bc -l`
SIZE_xhdpi=`expr $DPSIZE \* 2`
SIZE_xxhdpi=`expr $DPSIZE \* 3`
SIZE_xxxhdpi=`expr $DPSIZE \* 4`



mkdir -p "${ASSETDIR}ldpi"
mkdir -p "${ASSETDIR}mdpi"
mkdir -p "${ASSETDIR}hdpi"
mkdir -p "${ASSETDIR}xhdpi"
mkdir -p "${ASSETDIR}xxhdpi"
mkdir -p "${ASSETDIR}xxxhdpi"

if [ $USE_INKSCAPE == 1 ] ; then
  echo "Using inkscape to convert SVG"
  $INKSCAPE_PATH  -z -e `pwd`/${ASSETDIR}ldpi/$IMAGENAME.png -w $SIZE_ldpi `pwd`/$IMAGE   
  $INKSCAPE_PATH  -z -e `pwd`/${ASSETDIR}mdpi/$IMAGENAME.png -w $SIZE_mdpi `pwd`/$IMAGE   
  $INKSCAPE_PATH  -z -e `pwd`/${ASSETDIR}hdpi/$IMAGENAME.png -w $SIZE_hdpi `pwd`/$IMAGE   
  $INKSCAPE_PATH  -z -e `pwd`/${ASSETDIR}xhdpi/$IMAGENAME.png -w $SIZE_xhdpi `pwd`/$IMAGE   
  $INKSCAPE_PATH  -z -e `pwd`/${ASSETDIR}xxhdpi/$IMAGENAME.png -w $SIZE_xxhdpi `pwd`/$IMAGE   
  $INKSCAPE_PATH  -z -e `pwd`/${ASSETDIR}xxxhdpi/$IMAGENAME.png -w $SIZE_xxxhdpi `pwd`/$IMAGE   
else 
  convert $IMAGE  \
  \( +clone -resize $SIZE_ldpi -write ${ASSETDIR}ldpi/$IMAGENAME.png +delete \) \
  \( +clone -resize $SIZE_mdpi -write ${ASSETDIR}mdpi/$IMAGENAME.png +delete \) \
  \( +clone -resize $SIZE_hdpi -write ${ASSETDIR}hdpi/$IMAGENAME.png +delete \) \
  \( +clone -resize $SIZE_xhdpi -write ${ASSETDIR}xhdpi/$IMAGENAME.png +delete \) \
  \( +clone -resize $SIZE_xxhdpi -write ${ASSETDIR}xxhdpi/$IMAGENAME.png +delete \) \
  \( +clone -resize $SIZE_xxxhdpi -write ${ASSETDIR}xxxhdpi/$IMAGENAME.png +delete \) \
null:
fi
echo "\x1B[32mDrawables for $IMAGENAME were successfully created for $DPSIZE DP and can be found in $ASSETDIR<\*dpi> directory \x1B[39m"