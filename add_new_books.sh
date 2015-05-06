#!/bin/bash

export INBOX="/media/share_drive/ebook_inbox/"
export LIBRARY="/media/share_drive/Calibre Library"
LOGFILE="${INBOX}/logs/new_books.log"

# check for the directory
[ -d "$INBOX" ] || exit 1

# Function to add the new books if found
book_add () {
   calibredb add --with-library "$LIBRARY" "$1" && rm -f "$1"
}

# Export the funtion
export -f book_add

# Find all new ebooks and add to library
find "$INBOX" -name *.epub -exec bash -c 'book_add "$0"' {} \;

exit 0
