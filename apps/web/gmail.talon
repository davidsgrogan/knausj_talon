tag: browser
browser.host: mail.google.com
#https://support.google.com/mail/answer/6594?hl=en&co=GENIE.Platform%3DDesktop
-

thread last: key(k)
thread next: key(j)
archive: key(e)

#(email | message) new: key(n)
compose [new]: key(c)
report spam: key(!)
reply: key(r)
reply all: key(a)
(email | message) send: key(super-enter)
(undo | undo it | undo send): key(z)

search: key(/)

go [to] inbox:
    key(g)
    key(i)
go [to] drafts:
    key(g)
    key(d)

go [to] sent:
    key(g)
    key(t)

(go [to] | open) (mail | inbox): key(super-alt-1)
(go [to] | open) chat: key(super-alt-2)
(go [to] | open) meet: key(super-alt-3)

attach file: user.click_webpage_AXPopUpButton("Attach files")
