from talon import Context, actions

ctx = Context()
ctx.matches = r"""
app: iterm2
"""
directories_to_remap = {}
directories_to_exclude = {}

# This is not the standard shortcuts. I use them with the kinesis.
@ctx.action_class("app")
class AppActions:
    def tab_next():
        actions.key("ctrl-pagedown")

    def tab_previous():
        actions.key("ctrl-pageup")

# --- Implement actions ---
@ctx.action_class("user")
class user_actions:
    # user.tabs
    def tab_jump(number):
        if number <= 9:
            actions.key(f"cmd-{number}")

    def tab_final():
        actions.key("cmd-9")
    # def file_manager_current_path():
    #     title = ui.active_window().title

    #     if "~" in title:
    #         title = os.path.expanduser(title)

    #     if title in directories_to_remap:
    #         title = directories_to_remap[title]

    #     if title in directories_to_exclude:
    #         title = None

    #     return title

    # def file_manager_show_properties():
    #     """Shows the properties for the file"""

    # def file_manager_open_directory(path: str):
    #     """opens the directory that's already visible in the view"""
    #     actions.insert("cd ")
    #     path = '"{}"'.format(path)
    #     actions.insert(path)
    #     actions.key("enter")
    #     actions.user.file_manager_refresh_title()

    # def file_manager_select_directory(path: str):
    #     """selects the directory"""
    #     actions.insert(path)

    # def file_manager_new_folder(name: str):
    #     """Creates a new folder in a gui filemanager or inserts the command to do so for terminals"""
    #     name = '"{}"'.format(name)

    #     actions.insert("mkdir " + name)

    # def file_manager_open_file(path: str):
    #     """opens the file"""
    #     actions.insert(path)
    #     actions.key("enter")

    # def file_manager_select_file(path: str):
    #     """selects the file"""
    #     actions.insert(path)

#    def terminal_list_directories():
#        actions.insert("ls")
#        actions.key("enter")
#
#    def terminal_list_all_directories():
#        actions.insert("ls -a")
#        actions.key("enter")
#
#    def terminal_change_directory(path: str):
#        actions.insert("cd {}".format(path))
#        if path:
#            actions.key("enter")
#
#    def terminal_change_directory_root():
#        """Root of current drive"""
#        actions.insert("cd /")
#        actions.key("enter")
#
#    def terminal_clear_screen():
#        """Clear screen"""
#        actions.key("ctrl-l")
#
#    def terminal_run_last():
#        actions.key("up enter")
#
#    def terminal_kill_all():
#        actions.key("ctrl-c")
#        actions.insert("y")
#        actions.key("enter")
#
