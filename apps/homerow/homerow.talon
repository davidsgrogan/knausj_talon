os: mac
mode: command
-
# Homerow (with search + labels enabled)
^ax [<user.text>]: user.homerow_search("{text or ''}")
^ax clothes$: user.homerow_search("close")

toggle sleep: user.my_toggle_sleep_directly()
