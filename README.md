# Amplify

Helper functions to extend any command in bash

## Problem

If you want a command or a tool in bash has a certain functionality, your options are;

- Create a feature request to the owner or maintainer of the tool
- Develop the functionality yourself and submit a pull request
- Use another tool that has the functionality

Unfortunately, none of these options are always the best option

It'd be best if we could add the functionality to the command on ourselves.

## Solution

Amplify is a lightweight utility/framework that adds functionality to any command in bash. This allows you to add new functionality, extend existing functionality or create commands that just didn't exist before. Amplify is written in bash and is distributed under the open source MIT License.

## Installation

Execute the following command to install ebc:

```bash
curl -sL https://raw.githubusercontent.com/microsoft/amplify/main/install.sh | bash
```

## Usage

There are multiple ways to use ebc

### Calling add_extension method

You can call the `add_extension` method either by hand or programmatically;

```bash
add_extension \
  --command-name "az" \
  --sub-command-name "bicep" \
  --argument-name "--help" \
  --run "az_bicep_help"
```

ebc will add the `az bicep --help` to the `az` command if it's not exist, if it's exist, it'll shadow the existing command.

When the command executed, it will call the `az_bicep_help` function.

You can also add completely new command to the bash shell;

```bash
add_extension \
  --command-name "devops" \
  --sub-command-name "github" \
  --argument-name "--help" \
  --run "devops_github_help"
```

In this scenario, ebc will create the `devops github --help` command and add it to the bash shell.

When the command executed, it will call the `devops_github_help` function.

### Creating a bash script in the ~/.extensions directory

ebc will loop through all the sh files in the ~/.extensions directory and create commands for each of them.

```bash
# ~/.extensions/az.sh
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
```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit [Contributor License Agreement](https://cla.opensource.microsoft.com).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
