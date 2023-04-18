tag: terminal
and tag: user.git
-
git mb: "git map-branches\n"
git rebase update: "git rebase-update -n "
git upstream (deaf | diff): "git upstream-diff "
git upstream (deaf | diff) stat: "git upstream-diff --stat\n"
git seal upload [<user.text>]:
  "git-cl upload -t \"\""
  key("left")
  "{text or ''}"
git seal upload that:
  "git-cl upload -t "
  key("esc .")
git seal desk: "git-cl desc\n"
git squash branch: "git squash-branch"
git track branch: "git tb "
git rename branch [<user.text>]: "git rename-branch {text or ''}"

# dogs [<user.text>]:
#   "dogs {text or ''}"
  #"dogs {user.formatted_text(text or '', 'DASH_SEPARATED')}"

# Standard commands
git add patch: "git add . -p\n"
git add: "git add "
git add everything: "git add -u\n"
git bisect: "git bisect "
git blame: "git blame "
git branch: "git branch "
git branch list: "git branch -vv\n"
git remote branches: "git branch --remote\n"
git branch <user.text>: "git branch {text}"
git checkout: "git checkout "
git checkout master: "git checkout master\n"
git checkout main: "git checkout main\n"
git checkout <user.text>:
  "git checkout {text}"
  key("tab")
git cherry pick: "git cherry-pick "
git cherry pick continue: "git cherry-pick --continue "
git cherry pick abort: "git cherry-pick --abort "
git cherry pick skip: "git cherry-pick --skip "
git clone: "git clone "
# Leave \n out for confirmation since the operation is destructive
git clean everything: "git clean -dfx"
git commit message [<user.text>]: "git commit -m '{text or \'\'}'"
git commit all: "git commit -a "
git commit all message:
  "git commit -a -m \"\""
  key("left")
git commit [amend] no edit: "git commit -a --amend --no-edit"
git commit$: "git commit "
#git commit amend: "git commit --amend\n"
#git commit existing: "git commit -a\n"
git diff (colour | color) words: "git diff --color-words "
git diff [<user.text>]: "git diff {text or ''}"
git diff cached: "git diff --cached\n"
git diff tool: "git difftool -d\n"
git diff tool cached: "git difftool --cached -d\n"
git fetch: "git fetch "
git fetch all: "git fetch --all\n"
git fetch <user.text>: "git fetch {text}"
git fetch prune: "git fetch --prune\n"
git grep [<user.text>]: "git grep {text or ''}"
git gulp: "git grep "
git in it: "git init\n"
git log all: "git log\n"
git log all changes: "git log -c\n"
git log: "git log "
git log changes: "git log -c "
git log stat: "git log --stat "
git merge: "git merge "
git merge continue: "git merge --continue "
# git merge <user.text>: "git merge {text}"
git merge (tool | tab): "git mergetool\n"
git move: "git mv "
git pull: "git pull "
git pull origin: "git pull origin "
git pull rebase: "git pull --rebase\n"
git pull fast forward: "git pull --ff-only\n"
git pull <user.text>: "git pull {text} "
git push: "git push "
git push origin: "git push origin "
git push up stream origin: "git push -u origin"
git push <user.text>: "git push {text} "
git push tags: "git push --tags\n"
git rebase: "git rebase "
git rebase continue: "git rebase --continue"
git rebase interactive: "git rebase -i HEAD~"
git rebase skip: "git rebase --skip"
git rebase abort: "git rebase --abort"
git remove: "git rm "
git branch delete: "git branch -D "
git (remove|delete) branch: "git branch -D "
#git (remove|delete) remote branch: "git push --delete origin "
git reset: "git reset "
git reset soft: "git reset --soft "
git reset hard: "git reset --hard "
#git restore: "git restore "
#git restore staged: "git restore --staged "
#git restore source: "git restore --source="
git remote: "git remote "
git remote add: "git remote add "
git remote list: "git remote -v\n"
git remote set url: "git remote set-url "
git remote add upstream: "git remote add upstream "
git remote remove: "git remote remove "
git remote show origin: "git remote show origin\n"
git revert no edit: "git revert --no-edit "
git show: "git show "
git show stat: "git show --stat "
git stash pop: "git stash pop\n"
git stash: "git stash "
git stash apply: "git stash apply"
git stash list: "git stash list\n"
git stash show: "git stash show"
git status: "git status\n"
git switch [<user.text>]:
    "git switch {user.formatted_text(text or '', 'DASH_SEPARATED')}"
git switch master: "git switch master "
git switch main: "git switch main "
git switch detached: "git switch --detach "
git (switch create | new branch) [<user.text>]:
  "git nb {user.formatted_text(text or '', 'DASH_SEPARATED')}"
git switch orphan: "git switch --orphan "
git submodule add: "git submodule add "
git tag: "git tag "

# Convenience
git clone clipboard:
    insert("git clone ")
    edit.paste()
    key(enter)
git diff highlighted:
    edit.copy()
    insert("git diff ")
    edit.paste()
    key(enter)
git diff clipboard:
    insert("git diff ")
    edit.paste()
    key(enter)
git add highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    key(enter)
git add clipboard:
    insert("git add ")
    edit.paste()
    key(enter)
git commit highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    insert("\ngit commit\n")
