#!/usr/bin/env bash
# geschreven door Albert van Alphen (albert.rotterdam@laptoprevive.nl)

set -euo pipefail   # veiliger: stop bij fouten, ongedefinieerde variabelen, enz.

[[ $(id -u) -ne 0 ]] && echo "u dient root te zijn of run dit met sudo" && exit 1

echo "Standaard zoekmachine van Firefox aanpassen naar DuckDuckGo"

POLICY_DIR="/usr/lib/firefox/distribution"

if [[ ! -d "$POLICY_DIR" ]]; then
    sudo mkdir -p "$POLICY_DIR"
fi

sudo tee "$POLICY_DIR/policies.json" > /dev/null <<'EOF'
{
  "policies": {
    "SearchEngines": {
      "Default": "DuckDuckGo"
    }
  }
}
EOF

sudo chmod 644 "$POLICY_DIR/policies.json"

echo "zoekmachine succesvol ingesteld."
