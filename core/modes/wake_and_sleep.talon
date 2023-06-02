#defines the commands that sleep/wake Talon
mode: all
-
^(welcome back)+$:
    user.mouse_wake()
    user.history_enable()
    user.talon_mode()
^sleep all [<phrase>]$:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    user.engine_sleep()
^(snows | snooze)$: speech.disable()
^talon sleep [<phrase>]$: speech.disable()
# ^holy guacamole$: speech.enable()
^mittens the bad cat$: speech.enable()

key(ctrl-0):
  speech.toggle()
