open {user.website}: user.open_url(website)
open that: user.open_url(edit.selected_text())
open paste: user.open_url(clip.text())

{user.search_engine} hunt <user.text>$:
    user.search_with_search_engine(search_engine, user.text)
{user.search_engine} (that | this):
    text = edit.selected_text()
    user.search_with_search_engine(search_engine, text)
{user.search_engine} paste: user.search_with_search_engine(search_engine, clip.text())

recordings: user.openDirectory('/Users/dgrogan/.talon/recordings')
plex (downloads | download | sync | directory): user.openDirectory('/Users/dgrogan/Library/Application Support/Plex/Plex Media Server/Sync')

# This doesn't work; tries to open in a browser. At least I have the path saved here.
voice memos: user.openDirectory('/Users/dgrogan/Library/Group\ Containers/group.com.apple.VoiceMemos.shared/Recordings')
