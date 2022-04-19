#!/usr/bin/env bash

# declare global key-value pair variable
declare -g -A __COMMAND_EXTENSIONS

# to extend a command, start with a function that has the same name as the command
function add_extension() {
}
