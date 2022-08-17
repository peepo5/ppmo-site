#!/bin/bash

languages=( english french )
short_langs=( en fr )

for li in {0..1}; do

echo Combining MARKDOWN files...
cd $(echo "../../src/markdown/" | echo $languages[li])

# Print word counts

for i in {0..11}; do
    awk '(FNR==1){print "# Chapter " FILENAME""}1' "$i. "*.md
    printf "\n"
done > ../../../public/offline/_COMPLETE/md/en-3.0-main.md
echo Combined to MARKDOWN.

echo ""
word_count=$(wc -w *.md | grep total | awk '{print $1}')
echo "Total word count: $word_count."
etime=$(echo "$word_count 200" | awk '{printf "%.2f", $1/$2}')
echo "Estimated reading time: $etime Minutes."
echo ""

cd ../

echo "Zipping MARKDOWN files"
zip -r ../../public/offline/_COMPLETE/zip/en-3.0-main-markdown.zip english
echo "Zipping finished"
echo ""

cd ../../public/offline/_COMPLETE/md

for filename in *.md; do
    pandoc $filename -f gfm -V geometry:margin=0.9in -V papersize=A5 -o ../pdf/$filename-a5.pdf
    pandoc $filename -f gfm -V geometry:margin=1.1in -V papersize=A4 -o ../pdf/$filename.pdf
    pandoc $filename -f gfm --toc --standalone --metadata=title:"ppmo ($filename)" --top-level-division=chapter --metadata=lang:"en-US" --metadata=author:"free-synd" --metadata=cover-image:"../../../images/ppmo_circle_web.png"  -o ../epub/$filename.epub
    pandoc $filename -f gfm --toc --standalone --metadata=title:"ppmo ($filename)" --css ../_DRACULA_THEME/dracula.css --top-level-division=chapter --metadata=lang:"en-US" --metadata=author:"free-synd" --metadata=cover-image:"../../../images/ppmo_circle_web.png"  -o ../epub/$filename-dark.epub
done

echo ""

echo Combined to PDF, EPUB, EPUB-dark.
printf "Done...%s\n" "${files[1]}"

cd ../../

done