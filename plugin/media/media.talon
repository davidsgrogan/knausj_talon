volume up: key(volup)
volume down: key(voldown)
set volume <number>: user.media_set_volume(number)
(volume | media) mute: key(mute)
[media] play next: key(next)
[media] play previous: key(prev)
media (play | pause): user.play_pause()

fix [input] volume: user.change_input_volume(82)
# osascript -e "set volume input volume 80"
