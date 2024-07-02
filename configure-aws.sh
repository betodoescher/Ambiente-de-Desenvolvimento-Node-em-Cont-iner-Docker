#!/bin/bash

cat <<EOL > /root/.aws/credentials
[default]
aws_access_key_id=${AWS_ACCESS_KEY_ID}
aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}
EOL

cat <<EOL > /root/.aws/config
[default]
region=${AWS_DEFAULT_REGION}
output=json
EOL
