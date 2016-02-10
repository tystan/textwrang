tell application "TextWrangler"
	
	set docNameAndPath to POSIX path of (get file of front document)
	set docName to POSIX path of (get name of front document)
	set testn to docNameAndPath
	set docNmNoSlash to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & docName & "\"; sub(\"/\", \"\", THISSTR); print THISSTR}'")
	set docPath to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & testn & "\"; sub(/" & docNmNoSlash & "/, \"\", THISSTR); print THISSTR}'")
end tell
tell application "Terminal"
	set shell to do script "# -----------ABOUT TO PYGMENTS: " & docName & " -----------" in window 1
	activate
	do script "cd " & docPath in shell
	do script "THISSUBDIR=\"fig\"" in shell
	do script "if [ -d $THISSUBDIR ]; then echo \"### Subdir \"$THISSUBDIR\" exists ###\"; else mkdir $THISSUBDIR; fi" in shell
	do script "LATEX_OPTS=\"mathescape=True,encoding=utf8\"" in shell
	do script "VERBATIM_OPTS=\"verboptions=gobble=0,numbers=left,fontsize=\\footnotesize,tabsize=2\"" in shell
	do script "pygmentize -O $LATEX_OPTS -f tex -P $VERBATIM_OPTS -o " & docNmNoSlash & ".tex " & docNmNoSlash in shell
	do script "mv -f -v " & docNmNoSlash & ".tex fig/" in shell
	do script "# ----------------------SUCESS?----------------------" in shell
end tell
