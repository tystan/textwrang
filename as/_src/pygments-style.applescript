

tell application "TextWrangler"
	
	set docNameAndPath to POSIX path of (get file of front document)
	set docName to POSIX path of (get name of front document)
	set testn to docNameAndPath
	set docNmNoSlash to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & docName & "\"; sub(\"/\", \"\", THISSTR); print THISSTR}'")
	set docPath to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & testn & "\"; sub(/" & docNmNoSlash & "/, \"\", THISSTR); print THISSTR}'")
end tell
tell application "Terminal"
	set shell to do script "# -----------CREATING PYGMENTS STYLE FILE in: " & docPath & " -----------" in window 1
	activate
	do script "cd " & docPath in shell
	do script "THISSUBDIR=\"fig\"" in shell
	do script "if [ -d $THISSUBDIR ]; then echo \"### Subdir \"$THISSUBDIR\" exists ###\"; else mkdir $THISSUBDIR; fi" in shell
	do script "THISSTYLE=\"paraiso-light\"; pygmentize -f tex -S $THISSTYLE -a .syntax > fig/style.tex" in shell
end tell


