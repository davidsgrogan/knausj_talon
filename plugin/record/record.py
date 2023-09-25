from talon import Context, Module, actions, ui
# https://github.com/pokey/pokey_talon/blob/main/plugin/record/record.py

mod = Module()
mod.tag(
    "wax_is_recording",
    "Indicates that the screen is being recorded",
)
ctx = Context()

@mod.action_class
class UserActions:
    def start_recording(record_face: bool):
        """
        Start recording the screen

        Args:
            record_face (bool): Whether to also record the face using obs
        """
        # Start quicktime screen recording
        # https://github.com/pokey/wax_talon/blob/main/recorders/quicktime_recorder.py
        actions.key("cmd-shift-5")
        actions.sleep("500ms")
        actions.key("enter")

        actions.sleep("1s")

        ctx.tags = ["user.wax_is_recording"]

        # Slow down cursorless decorations
        # actions.user.change_setting("cursorless.pendingEditDecorationTime", 200)

        # Hide VSCode notifications that command recording has started
        # actions.sleep(1)
        # actions.key("escape")

        # actions.speech.disable()

    # def start_recording_light():
    #     """Start recording just cursorless"""
    #     actions.user.wax_start_recording(
    #         actions.user.wax_cursorless_recorder(False),
    #     )

    #     app.notify("Recording started")

    def stop_recording():
        """Stop recording"""
        # Stop quicktime screen recording
        ui.apps(bundle="com.apple.screencaptureui")[-1].children.find_one(
            AXRole="AXMenuBarItem"
        ).perform("AXPress")

        ctx.tags = []

        # Restore cursorless decoration speed
        # actions.user.change_setting("cursorless.pendingEditDecorationTime", 100)
