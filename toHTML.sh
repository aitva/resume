#!/bin/sh
set -e
echo "formating source code..."
markdownfmt -w .
echo "generating html..."
blackfriday-tool -page louis_arod.md louis_arod.html
