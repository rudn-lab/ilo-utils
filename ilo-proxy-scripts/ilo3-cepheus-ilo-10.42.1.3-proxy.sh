#!/bin/bash
ILO_SKIP_DEFAULTS=1 ILO_HOST=10.42.1.3 $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/../ilo-proxy.sh
