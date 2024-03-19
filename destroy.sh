#!/bin/bash
TEMPLATE_DIR=${2:-./templates}  # Get directory path from input or default to ./templates

  for template in "$TEMPLATE_DIR"/*.yaml; do
    # Extract stack name from filename
    stack_name="${template##*/}"
    stack_name="${stack_name%.yaml}"

    echo "Destroying stack: $stack_name"
    aws cloudformation delete-stack --stack-name "$stack_name"
  done