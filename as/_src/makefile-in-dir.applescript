tell application "TextWrangler"
	
	set docNameAndPath to POSIX path of (get file of front document)
	--display dialog docNameAndPath
	set docName to POSIX path of (get name of front document)
	set testn to docNameAndPath
	set docNmNoSlash to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & docName & "\"; sub(\"/\", \"\", THISSTR); print THISSTR}'")
	set docPath to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & testn & "\"; sub(/" & docNmNoSlash & "/, \"\", THISSTR); print THISSTR}'")
	--display dialog docPath
end tell
tell application "Terminal"
	--activate
	set shell to do script "cd " & docPath in window 1
	do script "make" in shell
end tell
