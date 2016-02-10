## `textwrang`
[TextWrangler](http://www.barebones.com/products/textwrangler/ "Thank you Bare Bones Software!") is my text editor of choice on Mac. 

The files I use to modify my use of TextWrangler are stored here.



Directory | Contents
--- | --- 
`as` | AppleScripts to use with TextWrangler
`syntax` | `.plist` files for syntax highlighting of specific file types and `.bbcolors` files for colours schemes




### TextWrangler and syntax highlighting


### TextWrangler and AppleScripts
Textwrangler not only allows you to run AppleScripts with user customisable key-strokes, but it has its own Scripting Dictionary that allows AppleScripts to interact with TextWrangler (and other applications). These AppleScripts allow you to perform otherwise repetitive or time consuming task while working in TextWrangler.

#### Example
As an example, the below AppleScript simply sends the selected text in TextWrangler (or line if no text is selected) to `terminal`.
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

### How to make TextWrangler aware of your AppleScripts

TextWrangler has a folder specifically to hold AppleScripts it uses (that you write). You can find it by going  
   `Script icon (next to Help) -> Open Scripts Folder`

![](https://github.com/tystan/textwrang/blob/master/fig/open-scrpt-folder.png)

The location is likely to be `~/Library/Application\ Support/TextWrangler/Scripts`

Copy and paste your scripts (or those in this repository) to this folder. TextWrangler should now be aware of your scripts. The names of the scripts in the folder should be seen under the Open Scripts Folder option when you click on the Script icon.

##### Now to make key-bindings

Now that your scripts are available to TextWrangler, you can go to  
   `Window -> Palettes -> Scripts`

![](https://github.com/tystan/textwrang/blob/master/fig/open-palettes.png)

Once the palettes window is open, you can assign key bindings to your available scripts. To do this, select a script and then press Set Shortcut; the key combination you press next is the new shortcut. Now any time you press `control+space` for example, TextWrangler will run the script associated with that key binding.


#### List of AppleScripts in `as` folder 

File | Description
--- | --- | ---
`file1`  | Does... 
`file2`  | Does... 
`file3`  | Does... 


---

### Acknowledgements

Firstly thank you to Bare Bones Software for making TextWrangler available as a free version of their [BBedit](http://www.barebones.com/products/bbedit/) text editor. Even the documentation for the free version is pretty great.

I have used many websites to understand how AppleScripts work and used some other websites that have provided AppleScripts that are made for TextWrangler. To the best of my memory and retrospective searching, thank you to these websites:
* website1
* website2


