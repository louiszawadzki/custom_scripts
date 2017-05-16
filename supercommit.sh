#!/bin/bash
echo -n "Type of commit:
[B]ugfix
[D]ocumentation
[F]eature
[P]erformance
[R]efactoring
[T]ests
"

read -n 1 option

case $option in
  B)
    emoji=":bug: "
    ;;
  D)
    emoji=":books: "
    ;;
  F)
    emoji=":sparkles: "
    ;;
  P)
    emoji=":horse_racing: "
    ;;
  R)
    emoji=":recycle: "
    ;;
  T)
    emoji=":rotating_light: "
    ;;
  *)
    emoji=""
esac

echo -n "

Type your commit message:
-> "

read message

git commit -m "$emoji$message"
