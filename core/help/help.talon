help alphabet: user.help_list("user.letter")
help symbols: user.help_list("user.symbol_key")
help numbers: user.help_list("user.number_key")
help punctuation: user.help_list("user.punctuation")
help modifier: user.help_list("user.modifier_key")
help special keys: user.help_list("user.special_key")
help function keys: user.help_list("user.function_key")
help arrows: user.help_list("user.arrow_key")
help context$: user.help_context()
help active$: user.help_context_enabled()
help search <user.text>$: user.help_search(text)
help context {user.help_contexts}$: user.help_selected_context(help_contexts)
help help: user.help_search("help")

# https://github.com/AndreasArvidsson/andreas-talon/blob/master/misc/help/help_active_context.py
# more at https://github.com/AndreasArvidsson/andreas-talon/tree/master/misc/talon_helpers
^help active context$:                 user.help_active_context_toggle()

help scope$: user.help_scope_toggle()
help snip: user.help_list("user.snippet")

(help formatters | help format | format help):
    user.help_formatters(user.get_formatters_words(), false)
(help re formatters | help re format | re format help):
    user.help_formatters(user.get_reformatters_words(), true)
