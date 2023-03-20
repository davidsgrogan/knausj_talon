open {user.website}: user.open_url(website)
{user.search_engine} hunt <user.text>$:
    user.search_with_search_engine(search_engine, user.text)
{user.search_engine} (that | this):
    text = edit.selected_text()
    user.search_with_search_engine(search_engine, text)

recordings: user.openDirectory('/Users/dgrogan/.talon/recordings')
plex (downloads | download | sync | directory): user.openDirectory('/Users/dgrogan/Library/Application Support/Plex/Plex Media Server/Sync')