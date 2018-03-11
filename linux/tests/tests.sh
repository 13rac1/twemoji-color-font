#!/bin/bash
# Tests of fontconfig configuration for Bitstream Vera and Twitter Color Emoji.
#
# The first two lines of the results of fc-match for each font request are
# are compared to known correct results. Any differences are shown.

# The test result file
TMP=current-results.test
# The expected test result file
EXPECTED=expected-results.test

FONTS[0]='sans'
FONTS[1]="sans-serif"
FONTS[2]="serif"
FONTS[3]="mono"
FONTS[4]="monospace"
FONTS[5]="emoji"
FONTS[6]="Twitter Color Emoji"
FONTS[7]="Apple Color Emoji"
FONTS[8]="Segoe UI Emoji"
FONTS[9]="Noto Color Emoji"

rm -f $TMP

# Run fc-match against all font values
for FONT in "${FONTS[@]}"; do
  echo "Font: $FONT" >> $TMP
  fc-match -s "$FONT" | head -n2 >> $TMP
  echo >> $TMP
done

# Create expected results if missing, aka delete to update.
if [ ! -f $EXPECTED ]; then
  cp $TMP $EXPECTED
  echo "Fontconfig tests: UPDATE"
  exit 1
fi
# Compare current results to expected results
echo diff $TMP $EXPECTED
diff -yt $TMP $EXPECTED
RESULT=$?
rm $TMP

if [ $RESULT -eq 0 ]; then
  echo "Fontconfig tests: PASS"
  exit 0
else
  echo "Fontconfig tests: FAIL"
  exit 1
fi
