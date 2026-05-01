#!/bin/bash
set -uo pipefail

echo -e "\nEventuele WiFi verbinding(en) verwijderen ... "
for CONNECTION in $(nmcli -t -f TYPE,UUID connection show|awk 'BEGIN{FS=":"} $1~/wireless$/ {print $2}')
do
    nmcli connection delete "$CONNECTION"
done
