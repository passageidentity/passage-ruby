# #!/bin/bash
# set -e

if [ -z "$1" ]; then
  echo "Required generator file is missing."
  exit 1
fi

file="$1"

npm install @openapitools/openapi-generator-cli -g

mkdir generated

openapi-generator-cli generate \
  -i "$file" \
  -g ruby \
  -o ./generated \
  --additional-properties=modelPropertyNaming=original

rm -rf ./docs/generated
mv ./generated/docs ./docs/generated

rm -rf ./lib/openapi_client
mv ./generated/lib/openapi_client ./lib

rm -rf ./generated