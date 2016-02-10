
tell application "TextWrangler"
	set the_selection to (selection of front window as string)
	if (the_selection) is "" then
		set the_selection to line (get startLine of selection) of front window as string
	end if
end tell
tell application "Terminal"
	set shell to do script the_selection in window 1
end tell

