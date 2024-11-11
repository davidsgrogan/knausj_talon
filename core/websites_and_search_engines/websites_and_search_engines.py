import webbrowser
import pathlib
from urllib.parse import quote_plus

from talon import Module

mod = Module()
mod.list("website", desc="A website.")
mod.list(
    "search_engine",
    desc="A search engine.  Any instance of %s will be replaced by query text",
)


@mod.action_class
class Actions:
    def open_url(url: str):
        """Visit the given URL."""
        webbrowser.open(url)

    def search_with_search_engine(search_template: str, search_text: str):
        """Search a search engine for given text"""
        url = search_template.replace("%s", quote_plus(search_text))
        webbrowser.open(url)
    def openDirectory(file: str):
        "Have Finder open a directory"
        url = pathlib.Path(file).as_uri()
        webbrowser.open(url)
