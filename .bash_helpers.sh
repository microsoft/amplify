#!/usr/bin/env bash

# declare global key-value pair variable
declare -g -A __COMMAND_EXTENSIONS

# to extend a command, start with a function that has the same name as the command
function add_extension() {
  POSITIONAL_ARGS=()

  while [[ $# -gt 0 ]]; do
    case ${1} in
      -c|--command-name)
        COMMAND_NAME="$2"
        shift
        shift
        ;;
      -s|--sub-command-name)
        SUB_COMMAND_NAME="$2"
        shift
        shift
        ;;
      -a|--argument-name)
        ARGUMENT_NAME="$2"
        shift
        shift
        ;;
      -r|--run)
        RUN="$2"
        shift
        shift
        ;;
      -*|--*)
        echo "Unknown option ${1}"
        exit 1
        ;;
      *)
        POSITIONAL_ARGS+=("${1}")
        shift
        ;;
    esac
  done

  set -- "${POSITIONAL_ARGS[@]}"

  local key=${COMMAND_NAME}
  local value=${__COMMAND_EXTENSIONS[${key}]}

  value="${value}$(cat <<EOF
    if [[ "\${1}" == "${SUB_COMMAND_NAME}" && "\${2}" == "${ARGUMENT_NAME}" ]]; then
      ${RUN} "\$@"
      return 0;
    fi
EOF
)"

__COMMAND_EXTENSIONS["${key}"]="${value}"
}

# create a copy of the original command
# idea from https://stackoverflow.com/questions/1203583/how-do-i-rename-a-bash-function
copy_function() {
  declare -F $1 > /dev/null || return 1
  eval "$(echo "${2}()"; declare -f ${1} | tail -n +2)"
}

function setup_extensions() {
  for entry in ~/.extensions/*.sh do
    source ${entry}

    FILE_NAME=${entry##*/}
    COMMAND_NAME="${FILE_NAME%.*}"

    COMMAND_INFO_JSON=$(_get_extension_info_json)

    for (( i=0; i<$(echo "${COMMAND_INFO_JSON}" | jq ". | length"); i++ )); do
      SUB_COMMAND_NAME=$(echo "${COMMAND_INFO_JSON}" | jq -r ".[${i}].SUB_COMMAND_NAME")
      ARGUMENT_NAME=$(echo "${COMMAND_INFO_JSON}" | jq -r ".[${i}].ARGUMENT_NAME")
      METHOD_NAME=$(echo "${COMMAND_INFO_JSON}" | jq -r ".[${i}].METHOD_NAME")

      FUNCTION_NAME="$(echo ${COMMAND_NAME}_${SUB_COMMAND_NAME}_${ARGUMENT_NAME} | sed -e 's/[^a-zA-Z0-9_]//g' -e 's/ /_/g')"

      copy_function "${METHOD_NAME}" ${FUNCTION_NAME}

      add_extension \
        --command-name "${COMMAND_NAME}" \
        --sub-command-name "${SUB_COMMAND_NAME}" \
        --argument-name "${ARGUMENT_NAME}" \
        --run "${FUNCTION_NAME}"
    done
  done
}
