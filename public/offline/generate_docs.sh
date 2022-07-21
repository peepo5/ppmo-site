#!/bin/bash

# Will make more dynamic later...

echo Combining MARKDOWN files...

cd ../../src/markdown/english/

# Print word counts


for i in {0..10}; do
    awk '(FNR==1){print "# Chapter " FILENAME""}1' "$i. "*.md
    printf "\n"
done > ../../../public/offline/_COMPLETE/md/en-1-main.md
echo Combined to MARKDOWN.

echo ""
word_count=$(wc -w *.md | grep total | awk '{print $1}')
echo "Total word count: $word_count."
etime=$(echo "$word_count 200" | awk '{printf "%.2f", $1/$2}')
echo "Estimated reading time: $etime Minutes."
echo ""

cd ../../../public/offline/_COMPLETE/md

for filename in *.md; do
    pandoc $filename -f gfm -o ../pdf/$filename.pdf
    pandoc $filename -f gfm --toc --standalone --metadata=title:"ppmo ($filename)" --top-level-division=chapter --metadata=lang:"en-US" --metadata=author:"free-synd" --metadata=cover-image:"../../../images/ppmo_circle_web.png"  -o ../epub/$filename.epub
    pandoc $filename -f gfm --toc --standalone --metadata=title:"ppmo ($filename)" --css ../_DRACULA_THEME/dracula.css --top-level-division=chapter --metadata=lang:"en-US" --metadata=author:"free-synd" --metadata=cover-image:"../../../images/ppmo_circle_web.png"  -o ../epub/$filename-dark.epub
done

echo ""

echo Combined to PDF, EPUB, EPUB-dark.
echo Done...