#! /bin/bash

# Count citations thrice (usually three words, sometimes more)
(grep cite [1-9]-*.tex tabell-artikler.tex | wc -l | awk 'END{print $1;}'; \
 grep cite [1-9]-*.tex tabell-artikler.tex | wc -l | awk 'END{print $1;}'; \
 grep cite [1-9]-*.tex tabell-artikler.tex | wc -l | awk 'END{print $1;}'; \
 wc -w [1-9]-*.tex tabell-artikler.tex | awk 'END{print $1;}') \
  | awk '{ sum+=$1} END {print sum}'
