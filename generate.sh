# #!/bin/bash
# set -e

if [ -z "$1" ]; then
  echo "Required generator file is missing."
  exit 1
fi

file="$1"

docker run --rm -v "${PWD}:/local" -u $(id -u) openapitools/openapi-generator-cli:v7.11.0 generate \
  -i "/local/$file" \
  -g ruby \
  -o /local/generated \
  --additional-properties=library=faraday \
  --global-property apiTests=false,modelTests=false,apiDocs=false,modelDocs=false \
  --model-name-mappings CreateUserRequest=CreateUserArgs,UpdateUserRequest=UpdateUserArgs,UserInfo=PassageUser

rm -rf ./lib/openapi_client
mv ./generated/lib/openapi_client ./lib

rm -rf ./lib/openapi_client.rb
mv ./generated/lib/openapi_client.rb ./lib/openapi_client.rb

rm -rf ./generated

sed -i.bak 's/require /require_relative /g' ./lib/openapi_client.rb && rm -f ./lib/openapi_client.rb.bak
