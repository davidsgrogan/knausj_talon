tag: terminal
-
# tags should be activated for each specific terminal in the respective talon file

lisa: 
    user.terminal_list_directories()
lisa all: 
    user.terminal_list_all_directories()
katie [<user.text>]: user.terminal_change_directory(text or "")
katie root: user.terminal_change_directory_root()
clear screen: user.terminal_clear_screen()
run last: user.terminal_run_last()
rerun [<user.text>]: user.terminal_rerun_search(text or "")
rerun search: user.terminal_rerun_search("")
kill all: user.terminal_kill_all()
veal: user.terminal_vim()
#vim: actions.insert("vim ")
print dir:                     "pwd\n"
grep:                          "grep "
#low: "ll "
#low <user.text>: "ll {text}"
later <user.text>: "ll -tr {text}"
later: "ll -tr "

# https://github.com/AndreasArvidsson/andreas-talon/tree/master/apps/terminal
history grep:                  "history | grep "
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
el dap: "dgrogan"
talon (dir | dear): "cd $HOME/.talon/user/knausj_talon\n"
secure copy: "scp "
secure shell: "ssh dgrogan.sfo.corp.google.com"
credentials: "gcert\n"
goma start: "goma ensure_start\n"
goma stop: "goma stop\n"

home (dir | dear): "cd\n"
go back: "cd -\n"
up (dir | dear) (dir | dear): "cd ../..\n"
up (dir | dear)$: "cd ..\n"
push (dir | dear):
  "pushd ."
  key("enter")
pop (dir | dear):
  "popd"
  key("enter")


# need to make this in bash only, not vim
copy paste:
    edit.copy()
    sleep(50ms)
    edit.paste()
