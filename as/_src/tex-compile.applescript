tell application "TextWrangler"
	
	set docNameAndPath to POSIX path of (get file of front document)
	--display dialog docNameAndPath
	set docName to POSIX path of (get name of front document)
	set testn to docNameAndPath
	set docNmNoSlash to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & docName & "\"; sub(\"/\", \"\", THISSTR); print THISSTR}'")
	--display dialog docNmNoSlash
	set theCharacters to characters of docNmNoSlash
	set theReversedCharacters to reverse of theCharacters
	set theReversedFileName to theReversedCharacters as string
	set theOffset to offset of "." in theReversedFileName
	set theReversedSuffix to text 1 thru (theOffset - 1) of theReversedFileName
	set theReversedPrefix to text (theOffset + 1) thru -1 of theReversedFileName
	set thePrefix to (reverse of (characters of theReversedPrefix)) as string
	set theSuffix to (reverse of (characters of theReversedSuffix)) as string
	set docPath to "" & (do shell script "awk 'BEGIN {THISSTR=\"" & testn & "\"; sub(/" & docNmNoSlash & "/, \"\", THISSTR); print THISSTR}'")
	--display dialog docPath
	
	set knitrExtension to {"Rnw", "rnw"}
	
end tell
--do shell script "echo " & the_file & " >> hasthisworked.txt" with administrator privileges
tell application "Terminal"
	---activate
	set shell to do script "# -----------ABOUT TO COMPILE: " & docName & " -----------" in window 1
	activate
	do script "cd " & docPath in shell
	do script "THISSUBDIR=\"pdf\"" in shell
	do script "if [ -d $THISSUBDIR ]; then echo \"### Subdir \"$THISSUBDIR\" exists ###\"; else mkdir $THISSUBDIR; fi" in shell
	do script "# -----------FILE SUFFIX::: " & theSuffix & " -----------" in shell
	if theSuffix is in knitrExtension then
		do script "# -----------FILE needs to be knitr-ed before latex-ed ::: " & theSuffix & " -----------" in shell
		set docNmNoSlash to thePrefix & "." & theSuffix
		do script "Rscript -e \"library(knitr); knit('" & docNmNoSlash & "')\"" in shell
		set docNmNoSlash to thePrefix & ".tex"
	else
		do script "# -----------FILE is to be latex-ed straight away ::: " & theSuffix & " -----------" in shell
	end if
	do script "latexmk -pdf -outdir=\"pdf\" " & docNmNoSlash in shell
	do script "# ----------------------SUCESS?----------------------" in shell
	do script "# ----------------------Now deleting the below files----------------------" in shell
	do script "rm -v pdf/*.fls pdf/*.aux pdf/*.log pdf/*.fdb_latexmk pdf/*.out" in shell
end tell
