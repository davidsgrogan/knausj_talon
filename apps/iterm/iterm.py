from talon import Context, Module, actions

ctx = Context()
mod = Module()

mod.apps.iterm2 = """
os: mac
and app.bundle: com.googlecode.iterm2
"""
ctx.matches = r"""
app: iterm2
"""

directories_to_remap = {}
directories_to_exclude = {}

# This is not the standard shortcut. I use them with the kinesis.
@ctx.action_class("app")
class AppActions:
    def tab_next():
        actions.key("ctrl-pagedown")
    def tab_previous():
        actions.key("ctrl-pageup")

# These next two are deleted upstream?
@ctx.action_class("edit")
class EditActions:
    def line_start():
        actions.key("home")

    def line_end():
        actions.key("end")


@ctx.action_class("user")
class UserActions:
    # user.tabs
    def tab_jump(number: int):
        if number <= 9:
            actions.key(f"cmd-{number}")

    def tab_final():
        actions.key("cmd-9")

    def terminal_clear_screen():
        """Clear screen"""
        actions.key("ctrl-l")
