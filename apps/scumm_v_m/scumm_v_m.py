from talon import Module, Context, actions, ui, ctrl
from talon.types import Rect as TalonRect

mod = Module()
ctx = Context()

mod.apps.scumm_v_m = r"""
os: mac
and app.bundle: org.scummvm.app
"""

ctx.matches = r"""
os: mac
app: scumm_v_m
"""


@mod.action_class
class Actions:
    def move_to_sword():
        """Search in Homerow"""
    def print_the_stuff():
        """Search in Homerow"""


def get_320_200_rect() -> TalonRect:
    game_rect = ui.active_window().rect
    # print(
    #     "ui.active_window().rect = ",
    #     ui.active_window().rect
    # )
    # game_rect.height -= 30
    # print("game_rect = ", game_rect)
    game_rect.top += 30
    # print("game_rect = ", game_rect)
    # print(
    #     "ui.active_window().rect = ",
    #     ui.active_window().rect
    # )
    ratio = game_rect.width / game_rect.height
    # print("ratio=", ratio)
    if ratio == 1.6:
        return game_rect
    bars_on_left = ratio > 1.6
    if bars_on_left:
        # print(
        #     "game_rect.width = ",
        #     game_rect.width,
        #     "height - 30 =",
        #     game_rect.height)
        extra_width = game_rect.width - game_rect.height * 1.6
        # print("extra_width=", extra_width)
        game_rect.x += extra_width / 2
        game_rect.width = game_rect.height * 1.6
    else:
        extra_height = game_rect.height - game_rect.width / 1.6
        game_rect.top += extra_height / 2
        game_rect.height = game_rect.width / 1.6

    # print("bars_on_left = ", bars_on_left)
    # print("Final ratio = ", game_rect.width / game_rect.height)
    return game_rect


@ctx.action_class("user")
class UserActions:
    def move_to_sword():
        print("top of move_to_sword")
        game_rect = get_320_200_rect()
        # actions.mouse_move(game_rect.left, game_rect.top)
        # return
        sleep_time = "50ms"
        sword1_x = game_rect.left + game_rect.width * 0.721
        sword_y = game_rect.top + game_rect.height * 0.089
        actions.mouse_move(sword1_x, sword_y)
        ctrl.mouse_click(1)
        actions.sleep(sleep_time)

        sword2_x = game_rect.left + game_rect.width * 0.947
        actions.mouse_move(sword2_x, sword_y)
        ctrl.mouse_click(1)
        actions.sleep(sleep_time)

        short_y = game_rect.top + game_rect.height * 0.167
        actions.mouse_move(sword1_x, short_y)
        ctrl.mouse_click(1)
        actions.sleep(sleep_time)

        actions.mouse_move(sword2_x, short_y)
        ctrl.mouse_click(0)
        actions.sleep("50ms")
        ctrl.mouse_click(1)
        actions.sleep("50ms")
        ctrl.mouse_click(0)

    def print_the_stuff():
      rect = ui.active_window().rect
      rect320 = get_320_200_rect()
      print(
          "the stuff is",
          rect.top,
          rect.height,
          rect.x,
          rect.width,
          *ctrl.mouse_pos(), rect320.x, rect320.width, rect320.top, rect320.height)
