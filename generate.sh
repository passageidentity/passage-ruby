# #!/bin/bash
# set -e

if [ -z "$1" ]; then
  echo "Required generator file is missing."
  exit 1
fi

file="$1"

docker run --rm -v "${PWD}:/local" -u $(id -u) openapitools/openapi-generator-cli:latest generate \
  -i "/local/$file" \
  -g ruby \
  -o /local/generated \
  --additional-properties=library=faraday \
  --model-name-mappings CreateUserRequest=CreateUserArgs,UpdateUserRequest=UpdateUserArgs,UserInfo=PassageUser

rm -rf ./docs/generated
mv ./generated/docs ./docs/generated
mv ./generated/README.md ./docs/generated

rm -rf ./lib/openapi_client
mv ./generated/lib/openapi_client ./lib

rm -rf ./lib/openapi_client.rb
mv ./generated/lib/openapi_client.rb ./lib/openapi_client.rb

rm -rf ./generated

sed -i 's/require /require_relative /g' ./lib/openapi_client.rb