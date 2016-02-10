## `textwrang`
[TextWrangler](http://www.barebones.com/products/textwrangler/ "Thank you Bare Bones Software!") is my text editor of choice on Mac. The files I use to customise TextWrangler are stored here. See the below table for the organisation of this repository.

Directory | Heading below | Contents
--- | :---: | --- 
`syntax` | 1 | `.plist` files for syntax highlighting of specific file types and `.bbColorScheme` files for colours schemes (version 5+)
`as` | 2 | AppleScripts to use with TextWrangler



### 1. TextWrangler and syntax highlighting

* Users can create their own files to recognise syntax from different languages in TextWrangler. The `.plist` files in the `syntax` directory can simply be copy and pasted into  
   `~Library/Application\ Support/TextWrangler/Language\ Modules/`  
for TextWrangler to recognise syntax for languages that don't already exist in TextWrangler.

* I prefer dark colour schemes when coding - this can manually be manufactured via `preferences`. In any case, I include a `.bbColorScheme` file that can be used to modify the appearance of TextWrangler (for use in TW version 5 or above). Simply copy `.bbColorScheme` files to  
   `~/Library/Application\ Support/TextWrangler/Color\ Schemes/`  
for colour themes to be usable by TextWrangler.

Don't forget to quit and re-start TextWrangler for the above changes to take effect.

### 2. TextWrangler and AppleScripts

Textwrangler not only allows you to run AppleScripts with user customisable key-strokes, but it has its own Scripting Dictionary that allows AppleScripts to interact with TextWrangler (and other applications). These AppleScripts allow you to perform otherwise repetitive or time consuming task while working in TextWrangler.

#### Example
As an example, the below AppleScript simply sends the selected text in TextWrangler (or line if no text is selected) to `Terminal`.
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

Copy and paste your scripts (or those in this repository with file extension `.scpt`) to this folder. TextWrangler should now be aware of your scripts. The names of the scripts in the folder should be seen under the Open Scripts Folder option when you click on the Script icon.

##### How to make key-bindings

Now that your scripts are available to TextWrangler, you can go to  
   `Window -> Palettes -> Scripts`

![](https://github.com/tystan/textwrang/blob/master/fig/open-palettes.png)

Once the palettes window is open, you can assign key bindings to your available scripts. To do this, select a script and then press Set Shortcut; the key combination you press next is the new shortcut. Now any time you press `control+space` for example, TextWrangler will run the script associated with that key binding.

![](https://github.com/tystan/textwrang/blob/master/fig/shortcut-palette.png)

#### List of AppleScripts in `as` folder 

File | Description
--- | --- | ---
`comment-line.scpt`  | Does... 
`makefile-in-dir.scpt`  | Does... 
`pygmentize.scpt`  | Does... 
`pygments-style.scpt`  | Does... 
`selection-to-r.scpt`  | Does... 
`selection-to-sh.scpt`  | Does... 
`tex-compile.scpt`  | Does... 
`tex-eqn.scpt`  | Does... 
`tex-itemize.scpt`  | Does... 
`tex-texttt.scpt`  | Does... 

		

---

### Acknowledgements

Firstly thank you to Bare Bones Software for making TextWrangler available as a free version of their [BBedit](http://www.barebones.com/products/bbedit/) text editor. Even the documentation for the free version is pretty great.

I have used many websites to understand how AppleScripts work and used some other websites that have provided AppleScripts that are made for TextWrangler. To the best of my memory and retrospective searching, thank you to these websites:
* [Jean Thioulouse](http://pbil.univ-lyon1.fr/JTHome/SendSelToR.txt) that first alerted me to TextWrangler and AppleScripts
* [Benjamin Waldie](http://www.mactech.com/articles/mactech/Vol.21/21.07/WorkingWithText/index.html) has an excellent run-through of manipulating text in AppleScripts
* [`rupa`](https://github.com/rupa/applescript) for the shell script to extract source code from `.scpt` files


