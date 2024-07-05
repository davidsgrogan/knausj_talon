from talon import Module, actions, app
from talon.mac import applescript

mod = Module()


@mod.action_class
class Actions:
    def play_pause():
        """Plays or pauses media"""
        if app.platform == "windows":
            actions.key("play_pause")
        else:
            actions.key("play")

    def change_input_volume(volume: int):
        """David wrote this"""
        # if app.platform == "mac":
        applescript.run(f"""set volume input volume {volume}""")
