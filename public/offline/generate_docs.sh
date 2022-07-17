#!/bin/bash

# Will make more dynamic later...

echo Combining MARKDOWN files...

cd ../../src/markdown/english/
for i in {0..10}; do
    awk '(FNR==1){print "# Chapter " FILENAME""}1' "$i. "*.md
    printf "\n"
done > ../../../public/offline/_COMPLETE/md/en-1-main.md
echo Combined to MARKDOWN!

cd ../../../public/offline/_COMPLETE/md
pwd

for filename in *.md; do
    pandoc $filename -f gfm -o ../pdf/$filename.pdf
    pandoc $filename -f gfm --toc --standalone --metadata=title:"ppmo ($filename)" --top-level-division=chapter --metadata=lang:"en-US" --metadata=author:"free-synd" --metadata=cover-image:"../../../images/ppmo_circle_web.png"  -o ../epub/$filename.epub
    pandoc $filename -f gfm --toc --standalone --metadata=title:"ppmo ($filename)" --css ../_DRACULA_THEME/dracula.css --top-level-division=chapter --metadata=lang:"en-US" --metadata=author:"free-synd" --metadata=cover-image:"../../../images/ppmo_circle_web.png"  -o ../epub/$filename-dark.epub
done

echo Combined to PDF, EPUB, EPUB-dark!
echo Done...