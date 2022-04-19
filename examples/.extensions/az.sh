function _get_extension_info_json() {
echo $(cat <<EOF
[
{
  "SUB_COMMAND_NAME": "bicep",
  "ARGUMENT_NAME": "--help",
  "METHOD_NAME": "bicep_help"
},
{
  "SUB_COMMAND_NAME": "bicep",
  "ARGUMENT_NAME": "generate",
  "METHOD_NAME": "bicep_generate"
}
]
EOF
)
}

bicep_help() {
  echo "az bicep --help"
}

bicep_generate() {
  echo "az bicep generate"
}
