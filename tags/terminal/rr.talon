tag: terminal
win.title: /MY RR/
-
# gdb rr stuff that should go into its own tag
# once you do one of these to set the title
# https://askubuntu.com/q/636944/86397
# https://superuser.com/q/84710/155324
# https://stackoverflow.com/q/1687642/681070
(step | into): "s\n"
next: "next\n"
(R | reverse) next: "rn\n"
breakpoints: "info b\n"
break: "b "
temp break [<number>]: "tb {number or ''}"
break <number>: "b {number}\n"
disable <number>: "disable {number}\n"
delete <number>: "delete {number}"
until <number>: "until {number}"
reverse continue: "rc\n"
continue: "c\n"
(fin [ish] | return): "finish\n"
reverse (fin | finish): "reverse-fin\n"
cross: key(ctrl-x o)
off: key(ctrl-x a)
print: "p "
(back | stack) trace: "bt\n"
(back | stack) trace <number>: "bt {number}\n"
frame: "f "
frame <number>: "f {number}\n"
(down | inner): "down\n"
(up | outer): "up\n"
watch: "watch -l "
