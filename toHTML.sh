#!/bin/sh
set -e
echo "formating source code..."
markdownfmt -w .

echo "generating html..."
cat > louis_arod.html <<EOT
<doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Louis Arod</title>
        <link rel="stylesheet" href="github.css" />
        <style>
            .markdown-body {
                box-sizing: border-box;
                min-width: 200px;
                max-width: 980px;
                margin: 0 auto;
                padding: 45px;
            }
        </style>
    </head>
    <body>
        <main class="markdown-body">
EOT
blackfriday-tool louis_arod.md >> louis_arod.html
cat >> louis_arod.html <<EOT
        </main>
    </body>
</html>
EOT