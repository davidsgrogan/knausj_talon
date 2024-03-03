new line: "\n"
double dash: "--"
triple quote: user.paste('"""')
(triple grave | triple back tick | gravy): insert("```")
(dot dot | dotdot): ".."
ellipsis: "..."
# Even though spamma is also in keys.py, the comma shows up without a space in vscode if I don't include this line in symbols.talon.
spamma: ", "
stacka: ": "
dotta: ". "
^pit dot$: key("pagedown")
arrow: "->"
dub arrow: "=>"
empty dub string: user.insert_between('"', '"')
empty escaped (dub string | dub quotes): user.insert_between('\\"', '\\"')
empty string: user.insert_between("'", "'")
empty escaped string: user.insert_between("\\'", "\\'")
(inside parens | args): user.insert_between("(", ")")
inside (squares | brackets | square brackets | list): user.insert_between("[", "]")
inside (braces | curly brackets): user.insert_between("{", "}")
inside percent: user.insert_between("%", "%")
inside (quotes | string): user.insert_between("'", "'")
inside (double quotes | dub quotes): user.insert_between('"', '"')
inside (graves | back ticks): user.insert_between("`", "`")
angle that:
    text = edit.selected_text()
    user.paste("<{text}>")
(square | bracket | square bracket) that:
    text = edit.selected_text()
    user.paste("[{text}]")
(brace | curly bracket) that:
    text = edit.selected_text()
    user.paste("{{{text}}}")
(parens | args) that:
    text = edit.selected_text()
    user.paste("({text})")
percent that:
    text = edit.selected_text()
    user.paste("%{text}%")
quote that:
    text = edit.selected_text()
    user.paste("'{text}'")
(dub | dot) quote that:
    text = edit.selected_text()
    user.paste('"{text}"')
(grave | back tick) that:
    text = edit.selected_text()
    user.paste("`{text}`")
