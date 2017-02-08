#!/bin/sh
set -e
	
alias errcho='>&2 echo'
if [ $# -ne 1 ]; then
    errcho "usage: $0 file.md"
    errcho "    Format Markdown file and produce an HTML preview."
    exit 1
fi

filename=$(basename "$1")
filename="${filename%.*}"
infile=$1
outfile="$filename.html"

echo "formating source code..."
markdownfmt -w .
    

echo "generating html..."
cat > $outfile <<EOT
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Louis Arod</title>
        <link rel="stylesheet" href="github.css" />
        <link rel="stylesheet" href="resume.css" />
    </head>
    <body>
        <main class="markdown-body">
EOT
blackfriday-tool $infile >> $outfile
cat >> $outfile <<EOT
        </main>
    </body>
</html>
EOT