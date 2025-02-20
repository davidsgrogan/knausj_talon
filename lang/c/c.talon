code.language: c
-
tag(): user.code_imperative

tag(): user.code_block_c_like
tag(): user.code_comment_line
tag(): user.code_comment_block_c_like
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_common
tag(): user.code_libraries
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_math
tag(): user.code_operators_pointer

settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

# NOTE: migrated from generic, as they were only used here, though once cpp support is added, perhaps these should be migrated to a tag together with the commands below
#state include:
#    insert('#include ""')
#    edit.left()

#control flow
#best used with a push like command
#the below example may not work in editors that automatically add the closing brace
#if so uncomment the two lines and comment out the rest accordingly
push braces:
    edit.line_end()
    insert("{")
    key(enter)
    # insert("{}")
    # edit.left()
    # key(enter)
    # key(enter)
    # edit.up()

# Declare variables or structs etc.
# Ex. * int myList
<user.c_variable> <phrase>:
    insert("{c_variable} ")
    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))

<user.c_variable> <user.letter>: insert("{c_variable} {letter} ")

# Ex. (int *)
#cast to <user.c_cast>: "{c_cast}"
#standard cast to <user.stdint_cast>: "{stdint_cast}"
<user.c_types>: "{c_types} "
