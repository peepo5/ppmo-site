# ppmo
This is the main site for ppmo.

You can test and edit dev by running `npm i` and `npm run dev`.

## Offline Documents
- You can find PDF files in [public/offline/_COMPLETE/pdf](public/offline/_COMPLETE/pdf).
- You can find EPUB (better for mobile) files in [public/offline/_COMPLETE/epub](public/offline/_COMPLETE/epub).
- You can find combined markdown files in [public/offline/_COMPLETE/md](public/offline/_COMPLETE/md).

## Contributing
We do not take contributions changing the content of the book except for spelling suggestions.

For spelling suggestions and any other contribution to the source code of the project, you can open a pull request using GitHub to contribute.

For the content of the book, it is found in `src/markdown`.

Public styling, content and media is found in `public`.

## Building to offline docs
Requires: pandoc, awk.

In [public/offline](public/offline):

`./generate_docs.sh`