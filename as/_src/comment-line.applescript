
tell front window of application "TextWrangler"
	--add prefix of selection prefix --"##########################################################--##############################"
	set theselection to selection
	if (selection as string) is "" then
		set theselection to line (get startLine of selection)
	end if
	--display dialog (selection as string)
	if (theselection as string) is "" then
		--display dialog "string empty"
		set thisstr to "###########"
		set final_string to ""
		repeat 8 times
			set final_string to final_string & thisstr
		end repeat
		repeat with x in lines of selection
			replace "^" using final_string searching in text of x options {search mode:grep}
		end repeat
	else
		
		--display dialog "non-empty string"
		repeat with x in lines of selection
			set lenx to length of x
			--display dialog lenx
			--if (x as string) is "" then
			if lenx < 1 then
				set thisstr to "###########"
				set final_string to ""
				repeat 8 times
					set final_string to final_string & thisstr
				end repeat
				replace "^" using final_string searching in text of x options {search mode:grep}
			else
				if (lenx < 88) then
					set halfl to ((88 - lenx) / 2 - 1) as integer
					--display dialog halfl
					set thisstr to "#"
					set final_string to ""
					repeat halfl times
						set final_string to final_string & thisstr
					end repeat
					--display dialog final_string
					replace "$" using (" " & final_string) searching in text of x options {search mode:grep}
					replace "^" using (final_string & " ") searching in text of x options {search mode:grep}
					--add prefix of x prefix (final_string & " ")
					--add suffix of x suffix (" " & final_string)
				end if
			end if
		end repeat
		
	end if
end tell
