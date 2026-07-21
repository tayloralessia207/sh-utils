#!/usr/bin/env bash
# random one-liners i keep forgetting — tayloralessia207

case "${1:-}" in
  myip)     curl -s ifconfig.me && echo ;;
  gitclean) git branch --merged | grep -v '\*' | xargs -r git branch -d ;;
  bigfiles) du -ah . 2>/dev/null | sort -rh | head -20 ;;
  ports)    ss -tulpn 2>/dev/null || netstat -tulpn ;;
  *)        echo "usage: $0 {myip|gitclean|bigfiles|ports}" ;;
esac
