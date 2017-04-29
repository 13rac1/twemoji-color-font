@ECHO OFF
SETLOCAL

SET MS_EMOJI_FONT_PATH="%SystemRoot%\Fonts\seguiemj.ttf"
SET MS_FONT_PATH="%SystemRoot%\Fonts\seguisym.ttf"

IF EXIST %MS_EMOJI_FONT_PATH% (
    ECHO Pressing [INSTALL] button in the Font Viewer will reinstall
    ECHO the original Segoe UI Emoji font.
    fontview %SystemRoot%\Fonts\seguiemj.ttf
)
ECHO.
ECHO Pressing [INSTALL] button in the Font Viewer will reinstall
ECHO the original Segoe UI Symbol font.
fontview %SystemRoot%\Fonts\seguisym.ttf
ECHO.
ECHO All Done!
PAUSE
