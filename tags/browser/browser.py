from urllib.parse import urlparse
import webbrowser
import subprocess

from talon import Context, Module, actions, app, ui

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: browser
"""

mod.list("browsers", "some description")
ctx.lists["self.browsers"] = {
    # Without -g, firefox does not open the new site if the browser is not
    # already running.
    "firefox": "/Applications/Firefox.app -g",
    "chrome": "/Applications/Google\\ Chrome.app",
    "canary": "/Applications/Google\\ Chrome\\ Canary.app",
    "stable": "/Applications/Google\\ Chrome.app",
    "safari": "/Applications/Safari\\ Technology\\ Preview.app", }


def is_url(url):
    try:
        # Valid if url successfully parsed
        result = urlparse(url)
        # and contains both scheme (e.g. http) and netloc (e.g. github.com)
        return all([result.scheme, result.netloc])
    except ValueError:
        return False

def get_the_address():
    address = actions.browser.address()
    if address == "":
        # The above line does not work in firefox.
        actions.browser.focus_address()
        actions.sleep("180ms")
        address = actions.edit.selected_text()
    if address == "":
        print("giving up")
        raise Exception("couldn't find an address")
    if not address.startswith("http"):
        # Safari omits the scheme if it is not secure.
        print(
            f"got a URL with no scheme ({address}) from {ui.active_app().name}")
        address = "http://" + address
    return address

@mod.action_class
class Actions:
    def browser_open_address_in_new_tab():
        """Open the url in the address bar in a new tab"""
        actions.key("alt-enter")

    def open_in(browsers: str):
        """dogs"""
        address = get_the_address()
        subprocess.run(f"/usr/bin/open -a {browsers} {address}", shell=True)

        # https://stackoverflow.com/questions/48056052/webbrowser-get-could-not-locate-runnable-browser
        # if open -a doesn't work well.
        # webbrowser.get(f"open -a {browsers} %s").open(address, new=2)

        # ui.launch("firefox", args=address)
        # print(browsers, "address = ", address)


@ctx.action_class("user")
class UserActions:
    def tab_jump(number: int):
        if number < 9:
            if app.platform == "windows":
                actions.key(f"ctrl-{number}")
            else:
                actions.key(f"alt-{number}")

    def tab_final():
        if app.platform == "windows":
            actions.key("ctrl-9")
        else:
            actions.key("alt-9")

    def tab_duplicate():
        actions.browser.focus_address()
        actions.sleep("180ms")
        possibly_edited_url = actions.edit.selected_text()
        actions.key("esc:2")
        actions.browser.focus_address()
        actions.sleep("180ms")
        url_address = actions.edit.selected_text()
        if possibly_edited_url == url_address:
            actions.user.browser_open_address_in_new_tab()
        else:
            actions.user.paste(possibly_edited_url)
            actions.app.tab_open()
            actions.user.paste(url_address)
            actions.key("enter")


@ctx.action_class("browser")
class BrowserActions:
    def address():
        # Split title by space, check each token and token[1: -1] (it might be in brackets) for valid url.
        # Prioritize last one if multiple are valid, return empty string if none is valid.
        tokens = (
            url[1:-1] if not is_url(url) else url
            for url in reversed(actions.win.title().split(" "))
        )
        return next((url for url in tokens if is_url(url)), "")

    def bookmark():
        actions.key("ctrl-d")

    def bookmark_tabs():
        actions.key("ctrl-shift-d")

    def bookmarks():
        actions.key("ctrl-shift-o")

    def bookmarks_bar():
        actions.key("ctrl-shift-b")

    def focus_address():
        actions.key("alt-d")

    def focus_page():
        actions.browser.focus_address()
        actions.sleep("180ms")
        actions.key("esc:2")
        actions.sleep("180ms")
        actions.key("esc:2")

    def focus_search():
        actions.browser.focus_address()

    def go_blank():
        actions.key("ctrl-n")

    def go(url: str):
        actions.browser.focus_address()
        actions.sleep("50ms")
        actions.insert(url)
        actions.key("enter")

    def go_home():
        actions.key("alt-home")

    def go_back():
        actions.key("alt-left")

    def go_forward():
        actions.key("alt-right")

    def open_private_window():
        actions.key("ctrl-shift-n")

    def reload():
        actions.key("ctrl-r")

    def reload_hard():
        actions.key("ctrl-shift-r")

    def show_downloads():
        actions.key("ctrl-j")

    def show_clear_cache():
        actions.key("ctrl-shift-delete")

    def show_history():
        actions.key("ctrl-h")

    def submit_form():
        actions.key("enter")

    def toggle_dev_tools():
        actions.key("ctrl-shift-i")
