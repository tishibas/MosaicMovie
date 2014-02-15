#!/bin/bash

montage -tile 3x3 -geometry 300x300 `ls -1` output.jpg

convert -gravity center -crop 440x440+0+0 output.jpg out008.jpg
for i in {1..7}; do convert -geometry 300x300 out00$i.jpg output00$i.jpg; done
