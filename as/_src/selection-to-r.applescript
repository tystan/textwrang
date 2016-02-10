--
-- Original by Jean Thioulouse - Nov. 2008 - Jean.Thioulouse_at_univ-lyon1.fr
-- This is a slightly modified version
--
tell application "TextWrangler"
	set the_selection to (selection of front window as string)
	if (the_selection) is "" then
		set the_selection to line (get startLine of selection) of front window as string
	end if
end tell
tell application "R"
	cmd the_selection
end tell
tell application "TextWrangler"
	try
		tell application "TextWrangler" to activate
		keystroke (ASCII character 31) --move cursor down one line
	end try
end tell
