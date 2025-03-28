from talon import Context, Module, actions, clip, ui

mod = Module()
ctx = Context()

ctx.matches = r"""
tag: browser
os: mac
"""


@mod.action_class
class Actions:
    def click_webpage_AXPopUpButton(text: str):
        """Clicks a webpage button with the given text or label."""
        click_AXPopUpButton_on_webpage(text)


def click_AXPopUpButton_on_webpage(button_text_or_label: str):
    """Clicks a button on a webpage with the specified AXDescription"""

    main_window = ui.active_app().windows()[0]
    button_text_or_label = 'Attach files'
    try:
        print("looking for", button_text_or_label)
        button_element = main_window.children.find_one(
            AXRole="AXPopUpButton",
            AXDescription=button_text_or_label,
            max_depth=30
        )
        print(button_element)
    except ui.UIErr:
        print(f"Button with text/label '{button_text_or_label}' not found.")
        return
    print("pushing")
    button_element.perform("AXPress")
