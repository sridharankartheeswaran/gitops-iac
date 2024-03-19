#!/bin/bash

ACTION=${1:-deploy}  # Allow specifying action (deploy or destroy)
TEMPLATE_DIR=${2:-./templates}  # Get directory path from input or default to ./templates

function deploy_stack() {
  # Existing deployment logic from previous script...
}

function destroy_stack() {
  for template in "$TEMPLATE_DIR"/*.yaml; do
    # Extract stack name from filename
    stack_name="${template##*/}"
    stack_name="${stack_name%.yaml}"

    echo "Destroying stack: $stack_name"
    aws cloudformation delete-stack --stack-name "$stack_name"
  done
}

if [[ "$ACTION" == "destroy" ]]; then
  destroy_stack
else
  deploy_stack
fi