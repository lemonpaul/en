#!/bin/bash

red=$(tput bold; tput setaf 1)
yellow=$(tput bold; tput setaf 3)
green=$(tput bold; tput setaf 2)
blue=$(tput bold; tput setaf 4)
normal=$(tput sgr0)

for word in "$@"
do
  translation=`grep -m 1 "^$word" $HOME/.en/en.dic`
  echo $translation | \
  sed -r "s/^($word\w*) (I) /\1 \n ${yellow}\2${normal} /;
  s/ (I(I{1,2}|[VX])|VI{0,3}|X{1,3}(VI{0,3}|I?(I{0,2}|[VX]))) / \n ${yellow}\1${normal} /g;
  s/ ([0-9]+\.) / \n  ${green}\1${normal} /g;
  s/ ([0-9]+\)) / \n   ${blue}\1${normal} /g;
  s/^($word[^ ]*)/${red}\1${normal}/"
done
