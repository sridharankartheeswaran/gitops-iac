#!/bin/bash
TEMPLATE_DIR=${1:-./templates}  # Get directory path from input or default to ./templates

for template in "$TEMPLATE_DIR"/*.yaml; do
  # Extract stack name from filename (assuming filename reflects stack name)
  stack_name="${template##*/}"
  stack_name="${stack_name%.yaml}"

  echo "Deploying stack: $stack_name"
  aws cloudformation deploy \
    --template-file "$template" \
    --stack-name "$stack_name" \
    --capabilities CAPABILITY_IAM  # Adjust capabilities if needed
  # Add error handling (optional)
done