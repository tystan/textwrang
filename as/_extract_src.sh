#!/bin/bash

# modified version of decompile.sh
# from https://github.com/rupa/applescript
# many thanks to rupa

# In the current dir, for all applescripts, extract 
# code as text. Put extracted source code in /_src and 
# make the file extensions ".applescript"

# to run terminal type:
# sh _extract_src.sh
[ -d _src/ ] || mkdir _src

for x in *.scpt; do
    osadecompile $x > _src/${x/.scpt/}.applescript
done