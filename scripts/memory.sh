#!/bin/sh
:
stat=`/usr/bin/free -m | grep "Mem:" | awk '{printf "%d %d", $3, $2}'`

/usr/bin/free -m | grep "Mem:" | awk '
{ mem_total=$2 }
{ mem_used=$3 }
END {
  used=(mem_used)/1024
  pct=mem_used/mem_total*100

  # full text
  printf(" %.2fG (%.f%%)\n", used, pct)

  # short text
  printf(" %.2fG\n", used)

  # color
  if (pct > 90) {
    print("#FF0000")
  } else if (pct > 80) {
    print("#FFAE00")
  } else if (pct > 70) {
    print("#FFF600")
  }
}'
