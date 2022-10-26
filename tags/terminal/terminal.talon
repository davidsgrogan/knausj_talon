tag: terminal
-
# tags should be activated for each specific terminal in the respective talon file

lisa: user.terminal_list_directories()
lisa all: user.terminal_list_all_directories()
katie [<user.text>]: user.terminal_change_directory(text or "")
katie root: user.terminal_change_directory_root()
go <user.system_path>: insert('cd "{system_path}"\n')
clear screen: user.terminal_clear_screen()
run last: user.terminal_run_last()
rerun [<user.text>]: user.terminal_rerun_search(text or "")
rerun search: user.terminal_rerun_search("")
kill all: user.terminal_kill_all()
veal [<user.text>]: user.terminal_vim(text or "")
print dir:                     "pwd\n"
grep:                          "grep "
grep <user.text>:              "grep {text}"
later <user.text>: "ll -tr {text}"
later: "ll -tr "
pe sacks: "ps ax"

# https://github.com/AndreasArvidsson/andreas-talon/tree/master/apps/terminal
history grep [<user.text>]:    "ctrl {text or ''}"
find grep:                     "find . | grep "
make dir:                      "mkdir "
move:                          "mv "
remove:                        "rm "
copy:                          "cp "
less:                          "less "
sudo:                          "sudo "
word count:                    "wc "
cat:                           "cat "
diff:                          "diff "
pipe:                          " | "
sim link:                      "ln -s "

talon (dir | dear): "cd $HOME/.talon/user/knausj_talon\n"
secure copy: "scp "
secure shell: "ssh "
ssh add: "ssh-add\n"
credentials: "gcert\n"
goma start: "goma ensure_start\n"
goma stop: "goma stop\n"
red green blue: "rgb "
red green blue <user.text>: "rgb {text}"

home (dir | dear): "cd\n"
go back: "cd -\n"
up (dir | dear) (dir | dear): "cd ../..\n"
up (deer | dear): "cd ..\n"
#push (dir | dear):
#  "pushd ."
#  key("enter")
#pop (dir | dear):
#  "popd"
#  key("enter")

# gdb rr stuff that should go into its own tag
# once you do one of these to set the title
# https://askubuntu.com/q/636944/86397
# https://superuser.com/q/84710/155324
# https://stackoverflow.com/q/1687642/681070
# (step | into): "s\n"
# next: "next\n"
# (are | reverse) next: "rn\n"
# breakpoints: "info b\n"
# break: "b "
# temp break [<number>]: "tb {number or ''}"
# history grep [<user.text>]:    "ctrl {text or ''}"
# break <number>: "b {number}\n"
# disable <number>: "disable {number}\n"
# delete <number>: "delete {number}"
# until <number>: "until {number}"
# reverse continue: "rc\n"
# continue: "c\n"
# (fin[ish] | return): "finish\n"
# reverse (fin | finish): "reverse-fin\n"
# cross: key(ctrl-x o)
# off: key(ctrl-x a)
# print: "p "
# (back | stack) trace: "bt\n"
# (back | stack) trace <number>: "bt {number}\n"
# frame: "f "
# frame <number>: "f {number}\n"
# (down | inner): "down\n"
# (up | outer): "up\n"
# watch: "watch -l "


# need to make this in bash only, not vim
copy paste:
    edit.copy()
    sleep(50ms)
    edit.paste()
