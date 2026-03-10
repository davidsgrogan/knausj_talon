from talon import Context, actions, app, mac, ui

ctx = Context()
ctx.matches = r"""
os: mac
tag: browser
"""


@ctx.action_class("user")
class UserActions:
    def tab_jump(number: int):
        if number < 9:
            actions.key(f"cmd-{number}")

    def tab_final():
        actions.key("cmd-9")

    def view_source():
        actions.key("cmd-alt-u")


@ctx.action_class("browser")
class BrowserActions:
    def address():
        try:
            window = ui.active_app().windows()[0]
        except IndexError:
            print("no windows, returning empty string from browser_mac.address")
            return ""

        valid_prefixes = (
            "http://",
            "https://",
            "file://",
            "chrome://",
            "devtools://",
            "about:")

        # 1. Appscript queries chrome directly instead of the macOS a11y API
        try:
            # Grab the appscript reference for the entire application, NOT the
            # specific window
            app_ref = ui.active_app().appscript()

            # Ask the app directly for its frontmost window
            front_window = app_ref.windows.first

            if tab := getattr(front_window, "active_tab", None):
                url = tab.URL()
                if url and url.startswith(valid_prefixes):
                    return url
        except Exception as e:
            # -1728 errors happen here during split-second tab switches.
            print(
                f"appscript attempt got {e}, browser_mac.address is falling back to actions.next()")

        print("now trying window.doc")
        doc_url = getattr(window, "doc", "") or ""
        if doc_url.startswith(valid_prefixes):
            return doc_url
        print(
            f"window.doc was blank or abnormal --- {doc_url} ---. Next trying AXTextField ...")

        try:
            # Search specifically for the text field labeled "Address and search
            # bar"
            address_bars = window.children.find(
                AXRole="AXTextField",
                AXDescription="Address and search bar",
                max_depth=10
            )
            if address_bars:
                # The actual URL string is stored in the AXValue property
                url = address_bars[0].AXValue
                print(f"Found URL from address_bars: {url}")
                return url
            else:
                print("Address bar not found.")
        except Exception as e:
            print(f"Error grabbing address bar: {e}")

        try:
            print("Now trying to look for AXWebArea")
            addresses = [
                web_area.AXURL for web_area in window.children.find(AXRole="AXWebArea")
            ]
            print("addresses from AXWebArea", len(addresses), ":", addresses)
            match len(addresses):
                case 0:
                    pass
                case 1:
                    return addresses[0]
                case _:
                    addresses = [
                        a
                        for a in addresses
                        if not (
                            a.startswith("devtools:")
                            or a.startswith("about:devtools")
                            or a.startswith("chrome://devtools/")
                            or a.startswith("chrome://newtab-footer/")
                        )
                    ]
                    if len(addresses) >= 1:
                        return addresses[0]
        except (ui.UIErr, AttributeError) as e:
            print("got exception looking for AXWebArea", e)

        print("now browser_mac.address is falling back :(")
        return actions.next()

    def bookmark():
        actions.key("cmd-d")

    def bookmark_tabs():
        actions.key("cmd-shift-d")

    def bookmarks():
        actions.key("cmd-alt-b")

    def bookmarks_bar():
        actions.key("cmd-shift-b")

    def focus_address():
        actions.key("cmd-l")

    def go_blank():
        actions.key("cmd-n")

    def go_home():
        actions.key("cmd-shift-h")

    def go_back():
        actions.key("cmd-[")

    def go_forward():
        actions.key("cmd-]")

    def open_private_window():
        actions.key("cmd-shift-n")

    def reload():
        actions.key("cmd-r")

    def reload_hard():
        actions.key("cmd-shift-r")

    def show_downloads():
        actions.key("cmd-shift-j")

    def show_clear_cache():
        actions.key("cmd-shift-backspace")

    def show_history():
        actions.key("cmd-y")

    def toggle_dev_tools():
        actions.key("cmd-alt-i")
