#!/bin/bash
wget -q --show-progress  https://dot.net/v1/install-dotnet.sh -O ~/.installers/install-dotnet.sh
/bin/bash ~/.installers/dotnet-install.sh --version latest
