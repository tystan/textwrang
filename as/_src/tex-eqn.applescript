
tell front window of application "TextWrangler"
	--add prefix of selection "\begin{itemize} \item <<selection>> \end{itemize}"
	set theselection to (selection as string)
	if theselection is "" then
		set theselection to line (get startLine of selection)
	end if
	--display dialog "\\\\texttt{" & theselection & "}"
	set text of selection to "$" & theselection & "$"
end tell


