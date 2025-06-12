from talon import Module, actions, app, ui
from talon.mac import applescript

mod = Module()

# Store the AppleScript code as a multi-line string
# This version returns true on success, false if not found/not running
APPLE_SCRIPT_FOCUS_GMAIL = """
set foundGmailTab to false
set targetWindowObject to missing value
set targetTabIndex to -1

try
    -- Check if Chrome is running AND has windows (prevents error if launched but no window yet)
    if application "Google Chrome" is not running then
        return false -- Indicate Chrome not running
    end if
    -- Check if there are any windows to iterate through
    if windows of application "Google Chrome" is {} then
         return false -- Indicate Chrome running but no windows
    end if

    -- Find the tab
    tell application "Google Chrome"
        repeat with i from 1 to (count of windows)
            set aWindow to window i
            -- Check if window exists before accessing tabs (robustness)
            if aWindow exists then
                repeat with j from 1 to (count of tabs of aWindow)
                    set aTab to tab j of aWindow
                    -- Check if tab exists before accessing properties
                    if aTab exists then
                        try
                            set tabTitle to title of aTab
                            set tabURL to URL of aTab
                            if tabTitle contains "Gmail" or tabURL contains "mail.google.com" then
                                set foundGmailTab to true
                                set targetWindowObject to aWindow
                                set targetTabIndex to j
                                exit repeat
                            end if
                        on error errMsg number errNum
                            -- Ignore errors reading properties of specific tabs (e.g., crashed tabs)
                            -- and continue searching. Output to Talon log if needed.
                            # log "Minor error reading tab properties - continuing: " & errMsg
                        end try
                    end if -- aTab exists
                end repeat -- end tab loop
            end if -- aWindow exists
            if foundGmailTab then exit repeat -- Exit window loop if found
        end repeat -- end window loop

        -- If found, activate and return true
        if foundGmailTab and targetWindowObject is not missing value then
            set index of targetWindowObject to 1
            set active tab index of targetWindowObject to targetTabIndex
            activate
            return true -- Indicate Success
        else
            -- If loop finished and no tab found
            return false -- Indicate tab not found
        end if
    end tell -- end tell Google Chrome

on error mainError number mainErrNum
    -- Propagate error back to Talon/Python to be caught
    error "AppleScript Error: " & mainError number mainErrNum
end try
"""

# Register the action with Talon
@mod.action_class
class UserActions:
    def focus_gmail_tab_action():
        """
        Runs an embedded AppleScript to find and focus a Gmail tab in Chrome.
        Handles success, failure (not found/not running), and errors via Talon notifications.
        """
        print("Talon action: focus_gmail_tab_action executing...") # For Talon log visibility
        try:
            # Execute the embedded AppleScript string
            # actions.os.run_applescript returns the AppleScript's return value
            was_successful = applescript.run(APPLE_SCRIPT_FOCUS_GMAIL)

            # Check the result (AppleScript 'true'/'false' maps to Python True/False)
            if was_successful:
                print("Gmail tab focused successfully.")
                # Optional: Notify on success if you want visual feedback
                # app.notify("Gmail Tab Focus", "Tab focused successfully.")
            else:
                # Handle cases where script returned false (Chrome not running, no windows, or tab not found)
                print("Gmail tab not found or Chrome not running/ready.")
                app.notify("Gmail Tab Focus", "Gmail tab not found or Chrome not running/ready.")

        except Exception as e:
            # Catch errors propagated from AppleScript's 'on error' block
            # or other potential Python exceptions during execution.
            error_message = f"Error executing focus_gmail_tab script: {e}"
            print(error_message) # Log detailed error
            app.notify("Gmail Tab Focus Script Error", "Check Talon log for details.") # User-friendly notification
