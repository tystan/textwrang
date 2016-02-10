
tell front window of application "TextWrangler"
	--add prefix of selection "\begin{itemize} \item <<selection>> \end{itemize}"
	set theselection to selection
	if (selection as string) is "" then
		set theselection to line (get startLine of selection)
	end if
	if (theselection as string) is "" then
		--display dialog "string empty"
		set final_string to "\\begin{itemize} \\item \\end{itemize}"
		repeat with x in lines of selection
			replace "^" using "\\\\begin{itemize}\\n\\\\item \\n\\\\end{itemize}" searching in text of x options {search mode:grep}
		end repeat
	else
		set lineno to 0
		--display dialog "non-empty string"
		repeat with x in lines of selection
			replace "^" using "\\\\item " searching in text of x options {search mode:grep}
			set lineno to (lineno + 1)
		end repeat
		set theselection to line (get startLine of selection)
		--display dialog (theselection as string)
		replace "^" using "\\\\begin{itemize}\\n" searching in text of theselection options {search mode:grep}
		set theselection to line (get endLine of selection)
		replace "$" using "\\n\\\\end{itemize}" searching in text of theselection options {search mode:grep}
		--display dialog (theselection as string)
	end if
end tell


