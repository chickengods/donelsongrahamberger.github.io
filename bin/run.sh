#! /bin/bash

echo "starting website"
echo "building css"
npm run build:css

echo "css built"

echo "launching website"
bundle exec jekyll serve
