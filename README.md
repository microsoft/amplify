# Extending Bash Commands

Helper functions to extend any command in bash

## Problem

If you want a command or a tool in bash has a certain functionality, your options are;

- Create a feature request to the owner or maintainer of the tool
- Develop the functionality yourself and submit a pull request
- Use another tool that has the functionality

Unfortunately, none of these options are always the best option

It'd be best if we could add the functionality to the command on ourselves.

## Solution

ebc is a lightweight utility/framework that adds functionality to any command in bash. This allows you to add new functionality, extend existing functionality or create commands that just didn't exist before. ebc is written in bash and is distributed under the open source MIT License.

## Installation

Execute the following command to install ebc:

```bash
curl -sL https://raw.githubusercontent.com/microsoft/extend-bash-commands/main/install.sh | bash
```

## Usage

There are multiple ways to use ebc

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
