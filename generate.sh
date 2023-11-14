# #!/bin/bash
# set -e

if [ -z "$1" ]; then
  echo "Required generator file is missing."
  exit 1
fi

file="$1"

# rm -rf ./generated
npm install @openapitools/openapi-generator-cli -g

mkdir generated

openapi-generator-cli generate \
  -i "$file" \
  -g ruby \
  -o ./generated \
  --additional-properties=modelPropertyNaming=original

rm generated/Dockerfile
rm generated/Gemfile
rm generated/Rakefile
rm generated/README.md
