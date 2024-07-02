#!/bin/bash
ILO_SKIP_DEFAULTS=1 ILO_LOGIN=Administrator ILO_HOST=10.42.1.3 ILO_VERSION=3 $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/../ilo-console.sh
