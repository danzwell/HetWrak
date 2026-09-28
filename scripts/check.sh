#!/usr/bin/env bash
# Draait precies wat de CI ook draait. Geen Azure-account nodig.
set -uo pipefail
cd "$(dirname "$0")/.."

fail=0
echo "== terraform =="
if command -v terraform >/dev/null 2>&1; then
  terraform -chdir=infra init -backend=false -input=false -no-color >/dev/null 2>&1
  terraform -chdir=infra validate -no-color || fail=1
else
  echo "  terraform niet gevonden, overgeslagen"
fi

echo
echo "== kubernetes =="
if command -v kubeconform >/dev/null 2>&1; then
  kubeconform -strict -summary k8s/ || fail=1
else
  echo "  kubeconform niet gevonden — installeren:"
  echo "  https://github.com/yannh/kubeconform/releases"
fi

echo
if [ "$fail" -eq 0 ]; then
  echo "Alles groen. Dat betekent alleen dat de schema's kloppen."
  echo "De interessantste problemen hier ziet geen enkele validator."
else
  echo "Rood. Begin daar."
fi
exit $fail
