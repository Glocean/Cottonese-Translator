#!/bin/bash
read -p "Enter text: " text

echo "$text" | awk '
{
    for (i=1; i<=NF; i++) {
        word = $i
        punctuation = ""
        while (match(word, /[[:punct:]]+$/)) {
            punctuation = substr(word, RSTART, RLENGTH) punctuation
            word = substr(word, 1, RSTART-1)
        }
        split(word, chars, "")
        reversed = ""
        for (j=length(chars); j>0; j--) {
            reversed = reversed chars[j]
        }
        printf "%s%s ", reversed, punctuation
    }
}' | sed 's/ $//'
