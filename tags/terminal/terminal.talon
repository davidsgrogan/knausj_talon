tag: terminal
-
# tags should be activated for each specific terminal in the respective talon file

lisa: user.terminal_list_directories()
lisa all: user.terminal_list_all_directories()
katie [dir] [<user.text>]: user.terminal_change_directory(text or "")
katie root: user.terminal_change_directory_root()
katie (up | back): user.terminal_change_directory("..")
go <user.system_path>: insert('cd "{system_path}"\n')
path <user.system_path>: insert('"{system_path}"')
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
sudo apt install: "sudo apt install "


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

connect to work: "connect_to_work\n"
talon log: "title talon log && ~/.talon/bin/tail_log\n"
talon command line: "~/.talon/bin/repl\n"
big rebase: "big_rebase_func\n"
start (xpra | extra): "start_xpra\n"
reload [dot] bash R C: ". ~/.bashrc\n"

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

# need to make this in bash only, not vim
copy paste:
    edit.copy()
    sleep(50ms)
    edit.paste()
