new line: "\n"
double dash: "--"
triple quote: user.paste('"""')
triple grave | triple back tick | gravy: "```"
(dot dot | dotdot): ".."
ellipsis: "..."
# Even though spamma is also in keys.py, the comma shows up without a space in vscode if I don't include this line in symbols.talon.
spamma: ", "
stacka: ": "
dotta: ". "
^pit dot$: key("pagedown")
arrow: "->"
dub arrow: "=>"

# Insert delimiter pairs
<user.delimiter_pair>: user.delimiter_pair_insert(delimiter_pair)

# Wrap selection with delimiter pairs
<user.delimiter_pair> that: user.delimiter_pair_wrap_selection(delimiter_pair)
