# Twitter Color Emoji SVGinOT Font
A color and B&W emoji SVGinOT font built primarily from the
[Twitter Emoji for Everyone][1] artwork.

The font works in all operating systems, but will currently only show color
emoji in Mozilla Firefox and Thunderbird. This is not a limitation of the font,
but of the operating systems and applications. Regular B&W outline emoji are
included for backwards/fallback compatibility.

[Do you prefer Emoji One graphics?][2]

[1]: https://github.com/twitter/twemoji
[2]: https://github.com/eosrei/emojione-color-font

Get the **alpha** version from releases: https://github.com/eosrei/twemoji-color-font/releases

## Example

Mini demo in Firefox/Linux.
![Firefox color emoji in Linux](images/twemoji-font-demo.png?raw=true)

# More details coming soon!

## Install on Linux

The fontconfig below is required to override `DejaVuSans` b&w emoji
on most Linux distributions.

The font is available to Arch Linux users via the [AUR](https://aur.archlinux.org/packages/twemoji-color-font) package. `$ yaourt -S twemoji-color-font`

```sh
# 1. Install the font

# 2. Create a font config directory
mkdir -p ~/.config/fontconfig/

# 3. Override your defaults by creating a ~/.config/fontconfig/fonts.conf
cat << 'EOF' > ~/.config/fontconfig/fonts.conf
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">

<fontconfig>
  <!--
  Make Twitter Color Emoji the initial fallback font for sans-serif, sans, and
  monospace. Override any specific requests for Apple Color Emoji.
  -->
  <match>
    <test name="family"><string>sans-serif</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Twitter Color Emoji</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>serif</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Twitter Color Emoji</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>monospace</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Twitter Color Emoji</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Apple Color Emoji</string></test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Twitter Color Emoji</string>
    </edit>
  </match>
</fontconfig>
EOF
# 4. Just to be sure, clear your font cache and restart Firefox
fc-cache -f -v
#Done!
```
