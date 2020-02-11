# Twitter Color Emoji SVGinOT Font

A color and B&W emoji SVGinOT font built from the
[Twitter Emoji for Everyone][1] artwork with support for [ZWJ][2],
[skin tone diversity][3] and [country flags][4].

The font works in all operating systems, but will *currently* only show color
emoji in Firefox, Thunderbird, Photoshop CC 2017, and Windows Edge V38.14393+.
This is not a limitation of the font, but of the operating systems and
applications. Regular B&W outline emoji are included for backwards/fallback
compatibility.

[1]: https://github.com/twitter/twemoji
[2]: https://unicode.org/emoji/charts/emoji-zwj-sequences.html
[3]: https://www.unicode.org/reports/tr51/#Diversity
[4]: https://www.unicode.org/reports/tr51/#Flags

## Table of Contents

* [Examples](#examples)
* [What is SVGinOT?](#what-is-svginot)
* [Install on Linux](#install-on-linux)
* [Install on OS X](#install-on-os-x)
* [Install on Windows](#install-on-windows)
* [Uninstalling](#uninstalling)
* [Building](#building)
* [License](#license)

## Examples

Demo in Firefox on Linux.
![Firefox color emoji in Linux](images/twemoji-font-demo.png?raw=true)

## What is SVGinOT?
*SVG in Open Type* is a standard by Adobe and Mozilla for color OpenType
and Open Font Format fonts. It allows font creators to embed complete SVG files
within a font enabling full color and even animations. There are more details
in the [SVGinOT proposal][6] and the [OpenType SVG table specifications][7].

SVGinOT Font demos (Firefox only):

* https://hacks.mozilla.org/2014/10/svg-colors-in-opentype-fonts/
* https://xerographer.github.io/reinebow/
* https://xerographer.github.io/multicoloure/

[6]: https://www.w3.org/2013/10/SVG_in_OpenType/
[7]: https://www.microsoft.com/typography/otspec/svg.htm

## Install on Linux
The font can be installed for a user or system-wide. Get the latest version
from releases: https://github.com/eosrei/twemoji-color-font/releases

*Note: This requires `Bitstream Vera` is installed and will change your
systems default serif, sans-serif and monospace fonts.*

### Why Bitstream Vera
The default serif, sans-serif and monospace font for most Linux distributions is
`DejaVu`. `DejaVu` includes a wide range of symbols which override the
`Twitter Color Emoji` characters. The previous solution was to make
`Twitter Color Emoji` the default system font, but that causes a number of issues.
A better solution is a different font that doesn't override any emoji characters
such as `Bitstream Vera`. `Bitstream Vera` is the source of the glyphs used in
`DejaVu`, so it's not very different. 99%+ of people will not notice the
difference.

### Additional default font options
The `Noto` and `Roboto` font families conflict far less than `DejaVu`. You may
want to try them. Primary issues are the 0x2639 and 0x263a characters.

### Known issues

* [Symbols/emoji in monospace formatted text cause incorrect character alignment][8].
  The whitespace character widths from the most recently selected
  fallback font are used in Pango/GTK applications.
* [[Issue #31][9]] [Some font families are not matched correctly in Linux Firefox][10].
  Workaround: Open `about:config` set
  `gfx.font_rendering.fontconfig.fontlist.enabled` to `false`.
  [Note: May cause crashes in Firefox <48.][11]

[8]:https://bugzilla.gnome.org/show_bug.cgi?id=757785
[9]:https://github.com/eosrei/emojione-color-font/issues/31
[10]:https://bugzilla.mozilla.org/show_bug.cgi?id=1245811
[11]:https://bugzilla.mozilla.org/show_bug.cgi?id=1266341

### Manual install on any Linux
Install for the current user without root:
```sh
# 1. Download the latest version
wget https://github.com/eosrei/twemoji-color-font/releases/download/v12.0.1/TwitterColorEmoji-SVGinOT-Linux-12.0.1.tar.gz
# 2. Uncompress the file
tar zxf TwitterColorEmoji-SVGinOT-Linux-12.0.1.tar.gz
# 3. Run the installer
cd TwitterColorEmoji-SVGinOT-Linux-12.0.1
./install.sh
```

### Install on Ubuntu Linux
Launchpad PPA: https://launchpad.net/~eosrei/+archive/ubuntu/fonts

```sh
sudo apt-add-repository ppa:eosrei/fonts
sudo apt-get update
sudo apt-get install fonts-twemoji-svginot
```

### Install on Arch Linux
Available in [AUR][AUR] as package [`ttf-twemoji-color`][aur-package].

[AUR]:https://wiki.archlinux.org/index.php/Arch_User_Repository
[aur-package]:https://aur.archlinux.org/packages/ttf-twemoji-color/

### Install on Gentoo Linux
Gentoo repository: https://github.com/jorgicio/jorgicio-gentoo

```sh
# Install layman using Portage with USE="git" enabled, the default.
emerge layman
# Add the repo.
layman -a jorgicio
# Install the package.
emerge twemoji-color-font
```

## Install on OS X
Both SVGinOT versions are available from releases:
https://github.com/eosrei/twemoji-color-font/releases

1. `TwitterColorEmoji-SVGinOT-12.0.1.zip` - The regular version of the font
   installs like any other font and can be specifically selected, but OS X will
   default to the `Apple Color Emoji` font for emojis.
2. `TwitterColorEmoji-SVGinOT-OSX-12.0.1.zip` - A hack to replace the `Apple
   Color Emoji` font by [using the same internal name][12]. Install and accept
   the warning in Font Book.

A [Homebrew](https://brew.sh) package is available.

```sh
# Tap the caskroom/fonts keg, if needed.
brew tap caskroom/fonts
# Install the font using brew
brew cask install font-twitter-color-emoji
```

[12]:https://www.macissues.com/2014/11/21/how-to-change-the-default-system-font-in-mac-os-x/

*Reiterating: Only FireFox supports the SVGinOT color emoji for now. Safari and
Chrome will use the fallback black and white emoji.*

## Install on Windows

There are two install options for Windows. Both SVGinOT versions are available
from releases: https://github.com/eosrei/twemoji-color-font/releases

### Standard install

The regular version of the font installs like any other font and can be
specifically selected, but Windows will default to the `Segoe UI Emoji`
font for emoji characters. Download:
https://github.com/eosrei/twemoji-color-font/releases/download/v12.0.1/TwitterColorEmoji-SVGinOT-12.0.1.zip

### Replace the default Windows emoji fonts

Windows 7, 8, 10 use emoji from both Segoe UI Symbol and Segoe UI Emoji. We
need to replace both fonts, but keep the existing symbol characters from
Segoe UI Symbol.

This package contains an install script that will generate both fonts (or
in Windows 7, just Segoe UI Symbol) and install them for you. Running the
install script requires both [Python][16] and pip in the PATH.

1. Download the most recent Python 3 for Windows: https://www.python.org/downloads/windows/
2. Start the installer, select "Add Python 3.6 to PATH" and finish the install process.
3. Download Twitter Color Emoji Windows package from releases:
https://github.com/eosrei/twemoji-color-font/releases/download/v12.0.1/TwitterColorEmoji-SVGinOT-Win-12.0.1.zip
4. Uncompress the file.
5. Open the new TwitterColorEmoji directory.
6. Run install.cmd. *Note: This will take some time.*
7. Install both new fonts when requested.
8. Done!

[16]:https://www.python.org/downloads/windows/

*Reiterating: Only FireFox and Edge (legacy) support the SVGinOT color emoji for now. Chrome and Edge (Chromium based) will use the
fallback black and white emoji.*

## Uninstalling

There are uninstall scripts for [Windows][17] and [Linux][18] available. They
are also included in the release files. 

[17]:windows/uninstall.cmd
[18]:linux/uninstall.sh

## Building
Overview:

1. B&W SVGs are generated on-the-fly from the color SVGs
2. The B&W SVGs are imported based on their filename to create either regular
   glyphs or ligature glyphs.
3. The color SVGs are imported to override both types of glyphs.

Requires:

* Inkscape
* Imagemagick
* potrace/mkbitmap
* FontTools 3.0+
* FontForge 20160405+
* SVGO
* make
* [SCFBuild][13] *(Created for this project!)*

[13]: https://github.com/13rac1/scfbuild

Setup and build on Ubuntu 18.04 LTS:

```sh
sudo apt-get update
sudo apt-get install inkscape potrace npm nodejs fontforge \
devscripts python-fontforge python-pip python-yaml imagemagick \
git make debhelper build-essential
sudo npm install -g svgo
sudo pip install fonttools
git clone https://github.com/eosrei/twemoji-color-font.git
cd twemoji-color-font
git clone https://github.com/13rac1/scfbuild.git SCFBuild
make -j 4
```

## License

The artwork and TTF fonts are licensed CC-BY-4.0. Please see
[LICENSE.md](LICENSE.md) for details.
