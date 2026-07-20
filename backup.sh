#!/usr/bin/env bash
# simple rsync backup — tayloralessia207
# usage: ./backup.sh /source/path

set -euo pipefail

SRC="${1:-$HOME}"
DST="${BACKUP_DEST:-/mnt/backup}"
STAMP=$(date +%Y-%m-%d)

if [ ! -d "$DST" ]; then
  echo "backup dest $DST not mounted" >&2
  exit 1
fi

rsync -avh --delete --exclude='.cache' --exclude='node_modules' \
      "$SRC/" "$DST/snapshot-$STAMP/"

echo "done. size:"
du -sh "$DST/snapshot-$STAMP"
