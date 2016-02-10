# textwrang
[TextWrangler](http://www.barebones.com/products/textwrangler/ "Thank you Bare Bones Software!") is my text editor of choice on Mac. 

The files I use to modify my use of TextWrangler (TW) are stored here.

# TW and AppleScripts
Textwrangler not only allows you to run AppleScripts (AS) with user customisable key-strokes, but it has its own Scripting Dictionay that allows AS to interact with TW (and other applications). These AS allow you to perform otherwise repetitive or time consuming task while working in TW.

# Example
Description
```AppleScript
tell application "TextWrangler"
    set the_selection to (selection of front window as string)
    if (the_selection) is "" then
        set the_selection to line (get startLine of selection) of front window as string
    end if
end tell
tell application "Terminal"
    set shell to do script the_selection in window 1
end tell
```
# How to make textwrangler aware of your AppleScripts

![](https://github.com/tystan/textwrang/blob/master/open-palettes.png)

![](https://github.com/tystan/textwrang/blob/master/open-scrpt-folder.png)

# Thanks goes to
