#!/bin/sh
#https://github.com/eosrei/twemoji-color-font
echo "Twitter Color Emoji font installer for Linux\n"

echo "NOTE: Changing default font family to DejaVu"

# Stop on errors
set -e
# Set XDG_DATA_HOME to default if empty.
if [ -z "$XDG_DATA_HOME" ];then
  XDG_DATA_HOME=$HOME/.local/share
fi

# Remove font from old directory if exists (temporary backwards compat)
if [ -f $HOME/.fonts/TwitterColorEmoji-SVGinOT.ttf ];then
  echo "Removing the font from $HOME/.fonts"
  rm $HOME/.fonts/TwitterColorEmoji-SVGinOT.ttf
fi

# Create a user font directory
mkdir -p $XDG_DATA_HOME/fonts
echo "Installing the font in: $XDG_DATA_HOME/fonts/"
cp TwitterColorEmoji-SVGinOT.ttf $XDG_DATA_HOME/fonts/

# Create a font config directory
FONTCONFIG=$HOME/.config/fontconfig
mkdir -p $FONTCONFIG/conf.d/
# Check for an existing font config
if [ -f $FONTCONFIG/fonts.conf ];then
  # (temporary backwards compat)
  echo "Existing fonts.conf backed up to fonts.bak"
  cp $FONTCONFIG/fonts.conf $FONTCONFIG/fonts.bak
fi
# Install fonts.conf
cp fontconfig/56-twemoji-color.conf $FONTCONFIG/conf.d/

echo "Clearing font cache"
fc-cache -f

echo "Done!"
