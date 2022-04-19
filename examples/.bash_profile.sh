# import helper functions for ebc
source ~/.bash_helpers.sh

function devops_github_help() {
  echo "devops_github_help"
}

add_extension \
  --command-name "devops" \
  --sub-command-name "github" \
  --argument-name "--help" \
  --run "devops_github_help"
