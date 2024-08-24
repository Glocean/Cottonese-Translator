#!/bin/bash

# Function to reverse the letters of a word, without changing the punctuation
reverse_word() {
  local word="$1"
  local reversed_word=""
  local punctuation=""

  # Extract punctuation characters from the word
  for (( i=0; i<${#word}; i++ )); do
    char="${word:$i:1}"
    if [[ ! -z "${char}" && ! -z "${char//[[:alpha:]]}" ]]; then
      punctuation="$punctuation$char"
      word="${word/${char}/}"
    fi
  done

  # Reverse the remaining word (without the punctuation)
  for (( i=$((${#word} - 1)); i >= 0; i-- )); do
    reversed_word="${reversed_word}${word:$i:1}"
  done

  # Re-add the punctuation to the end of the reversed word
  reversed_word="$reversed_word$punctuation"

  echo "$reversed_word"
}

# Read input
read -p "Enter text: " text

# Split the input into words and reverse each word
reversed_text=""
for word in $text; do
  reversed_text="$reversed_text $(reverse_word "$word")"
done

# Me??? Cleaning up the output?? impossible!
reversed_text=$(echo "$reversed_text" | sed 's/^ //; s/ $//')

# Print the Cottonese text and you're done! :3
echo "$reversed_text"
