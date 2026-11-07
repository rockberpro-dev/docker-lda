#!/usr/bin/env bash
# Fakes typing for each line of script.txt and evals it.
shopt -s expand_aliases
source "$LDA_DIR/docker-lda.sh" 2>/dev/null

GREEN=$'\e[32m'; GRAY=$'\e[90m'; RESET=$'\e[0m'

sleep 0.5
while IFS= read -r line || [ -n "$line" ]; do
  if [[ "$line" == \#* ]]; then
    printf '%s%s%s\n' "$GRAY" "$line" "$RESET"
    sleep 0.6
    continue
  fi
  printf '%s$ %s' "$GREEN" "$RESET"
  for ((i = 0; i < ${#line}; i++)); do
    printf '%s' "${line:i:1}"
    sleep 0.04
  done
  printf '\n'
  eval "$line"
  sleep 1.2
done < "$SCRIPT"
sleep 2
