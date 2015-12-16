#! /bin/sh

set -e

if [ -f index.html.org ]; then
  echo "Restoring original index.html"
  rm index.html
  cp index.html.org index.html
else
  echo "Creating backup of index.html"
  cp index.html index.html.org
fi

if [ "$API_KEY" != "**None**" ]; then
  sed -i "s|/\*||g" index.html
  sed -i "s|\*/||g" index.html
  sed -i "s|myApiKeyXXXX123456789|$API_KEY|g" index.html
fi

sed -i "s|http://petstore.swagger.io/v2/swagger.json|$API_URL|g" index.html
sed -i "s|http://example.com/api|$API_URL|g" index.html

if [ "$API_KEY_JWT" != "false" ]; then
  echo "Modyfing API Key support for JWT..."
  patch index.html jwt.patch
  echo "Make sure to include a security definition like this in your swagger.yaml:"
  echo -e "securityDefinitions:\n  bearer:\n    type: apiKey\n    name: Authorization\n    in: header"
else
  echo "Normal API Key mode"
fi

http-server -p 80
